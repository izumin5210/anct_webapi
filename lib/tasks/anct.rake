require 'nokogiri'
# require 'open-uri'

SYLLABUS_PATH = "#{Rails.root}/db/master/syllabus2013.xml"
# SYLLABUS_PATH = 'http://www.akashi.ac.jp/data/syllabus/syllabus2013.xml'

namespace :anct do
  namespace :master do
    task import: :environment do

      Rake::Task["db:reset"].invoke

      puts 'create Department...'
      {m: '機械工学科', e: '電気情報工学科', c: '都市システム工学科', a: '建築学科', adv: '専攻科'}.each do |abbr, name|
        Department.create name: name, abbr: abbr.to_s
      end

      puts 'create Course...'
      {d: '電気電子工学コース', j: '情報工学コース', me: '機械・電子システム工学専攻', ac: '建築・都市システム工学専攻'}.each do |abbr, name|
        Course.create name: name, abbr: abbr.to_s
      end

      puts 'import Syllabus...'
      xml = Nokogiri::XML(open(SYLLABUS_PATH).read)
      xml.xpath('//Course').each do |course|
        lecture = Lecture.create(
            title: course.xpath('Title').text,
            required_selective: course.xpath('RequiredSelective').text,
            divide: course.xpath('Divide').text,
            term: course.xpath('Term').text,
            credit: course.xpath('Credit').text,
            category: course.xpath('Category').text,
            abstract: course.xpath('Abstract').text,
            failure_absence: course.xpath('FailureAbsence').text,
            evaluation: course.xpath('Evaluation').text,
            textbooks: course.xpath('Textbooks').text
        )
        course.xpath('Lecturers/Lecturer').each do |name|
          lecture.lecturers << (Lecturer.where(name: name.text).first || Lecturer.new(name: name.text))
        end
        course.xpath('Contacts/Mail').each do |email|
          lecture.contacts << (Contact.where(email: email.text).first || Contact.new(email: email.text))
        end
        course.xpath('Plans/Plan').each do |plan|
          lecture.plans << Plan.new(
              number: plan['TopicsNumber'],
              title: plan.xpath('TopicsTitle').text,
              detail: plan.xpath('TopicsDetail').text
          )
        end
      end
    end
  end
end
