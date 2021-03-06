require 'nokogiri'
require 'nkf'

SYLLABUS_PATH = "#{Rails.root}/db/master/syllabus2013.xml".freeze
TIMETABLE_PATH = "#{Rails.root}/db/master/timetable201310.xml".freeze

MASTER_FILES = {
  2013 => {
    syllabus: "#{Rails.root}/db/master/syllabus2013.xml",
    timetable: ["#{Rails.root}/db/master/timetable201310.xml"]
  },
  2014 => {
    syllabus: "#{Rails.root}/db/master/syllabus2014.xml",
    timetable: ["#{Rails.root}/db/master/timetable201404.xml"]
  }
}

def parse_periods(lecture_node)
  start_period = case lecture_node.xpath('StartTime').text
    when '09:00:00+09:00' then 1
    when '10:40:00+09:00' then 2
    when '13:00:00+09:00' then 3
    when '14:40:00+09:00' then 4
    else nil
    end
  end_period = case lecture_node.xpath('EndTime').text
    when '10:30:00+09:00' then 1
    when '12:10:00+09:00' then 2
    when '14:30:00+09:00' then 3
    when '16:10:00+09:00' then 4
    else nil
    end

  if start_period == end_period || end_period.nil?
    [start_period]
  elsif end_period - start_period == 1
    [start_period, end_period]
  else
    [*start_period..end_period]
  end
end

def parse_department_and_course(lecture_node)
  department, course = nil
  if lecture_node.name == 'Lecture'
    department = lecture_node.xpath('Department').text
    course = lecture_node.xpath('Course').text
  else
    department, course = lecture_node.xpath('Department').text.split(' ')
  end
  if ['機械・電子システム工学専攻', '建築・都市システム工学専攻'].include? department
    course = department
    department = '専攻科'
  end
  [Department.where(name: department).first, Course.where(name: course).first]
end

def same_title?(title1, title2)
  t1 = NKF.nkf('-w -W -mZ01', title1).gsub(/Ⅰ/, 'I').gsub(/Ⅱ/, 'II').gsub(/Ⅲ/, 'III').gsub(/Ⅳ/, 'IV').gsub(/Ⅴ/, 'V').gsub(/\([男|女]子\)/, '').gsub(/ /, '')
  t2 = NKF.nkf('-w -W -mZ01', title2).gsub(/Ⅰ/, 'I').gsub(/Ⅱ/, 'II').gsub(/Ⅲ/, 'III').gsub(/Ⅳ/, 'IV').gsub(/Ⅴ/, 'V').gsub(/\([男|女]子\)/, '').gsub(/ /, '')
  t1 == t2
end

namespace :anct do
  namespace :master do
    task import: :environment do

      puts 'create Department...'
      {m: '機械工学科', e: '電気情報工学科', c: '都市システム工学科', a: '建築学科', adv: '専攻科'}.each do |abbr, name|
        Department.create name: name, abbr: abbr.to_s
      end

      puts 'create Course...'
      {d: '電気電子工学コース', j: '情報工学コース', me: '機械・電子システム工学専攻', ac: '建築・都市システム工学専攻'}.each do |abbr, name|
        Course.create name: name, abbr: abbr.to_s
      end

      MASTER_FILES.each do |year, files|
        puts "open #{files[:syllabus]}"
        syllabus_xml = Nokogiri::XML(open(files[:syllabus]).read).xpath('//Course')
        syllabus_xml.each_with_index do |lecture_node, i|
          print "- import Syllabus...(#{year}: #{i}/#{syllabus_xml.count})\r"
          department, course = parse_department_and_course(lecture_node)
          lecture = Lecture.create!(
              title: lecture_node.xpath('Title').text,
              required_selective: lecture_node.xpath('RequiredSelective').text,
              divide: lecture_node.xpath('Divide').text,
              term: lecture_node.xpath('Term').text,
              credit: lecture_node.xpath('Credit').text,
              category: lecture_node.xpath('Category').text,
              abstract: lecture_node.xpath('Abstract').text,
              failure_absence: lecture_node.xpath('FailureAbsence').text,
              evaluation: lecture_node.xpath('Evaluation').text,
              textbooks: lecture_node.xpath('Textbooks').text,
              grade: lecture_node.xpath('Year').text,
              department: department,
              course: course,
              year: year
            )
          lecture_node.xpath('Lecturers/Lecturer').each do |name|
            lecture.lecturers << (Lecturer.where(name: name.text).first || Lecturer.new(name: name.text))
          end
          lecture_node.xpath('Contacts/Mail').each do |email|
            next if email.text.blank?
            lecture.contacts << (Contact.where(email: email.text).first || Contact.new(email: email.text))
          end
          lecture_node.xpath('Plans/Plan').each do |plan|
            lecture.plans.create!(
                number: plan['TopicsNumber'],
                title: plan.xpath('TopicsTitle').text,
                detail: plan.xpath('TopicsDetail').text
              )
          end
        end
        puts "- import Syllabus...(#{year}: #{syllabus_xml.count}/#{syllabus_xml.count})\r"

        files[:timetable].each do |file|
          timetable_xml = Nokogiri::XML(open(file).read).xpath('//Lecture')
          puts "open #{file}"
          file =~ %r{\d{4}(\d{2})\.xml$}
          term = Settings.timetable.term[($+ == "04") ? 0 : 1]
          missed_lectures = []
          timetable_xml.each_with_index do |lecture_node, i|
            print "- import Timetable...(#{year}: #{i}/#{timetable_xml.size})\r"
            location_text = lecture_node.xpath('Location').text
            location = Location.where(name: location_text).first || Location.create(name: location_text)
            department, course = parse_department_and_course(lecture_node)
            grade = lecture_node.xpath('Grade').text
            lectures = if course.nil?
                Lecture.where(grade: grade).where(department: department).where(year: year)
              else
                Lecture.where(grade: grade).where(department: department).where(course: course).where(year: year)
              end
            is_matched = false
            lectures.each do |lecture|
              if same_title?(lecture.title, lecture_node.xpath('Name').text)
                parse_periods(lecture_node).each do |period|
                  Timetable.create!(
                      year: year,
                      term: term,
                      wday: lecture_node.xpath('Wday').text,
                      period: period,
                      location: location,
                      lecture: lecture
                    )
                  is_matched = true
                end
              end
            end
            missed_lectures << "#{lecture_node.xpath('Name').text}(#{grade}#{department.abbr != 'adv' ? department.abbr : ''}#{course.try(:abbr)})" unless is_matched
          end
          puts "- import Timetable...(#{year}: #{timetable_xml.size}/#{timetable_xml.size})"
          missed_lectures.each { |l| puts "    - #{l}" }
        end
      end

    end
  end
end
