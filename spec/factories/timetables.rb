# == Schema Information
#
# Table name: timetables
#
#  id            :integer          not null, primary key
#  lecture_id    :integer          not null
#  department_id :integer          not null
#  course_id     :integer
#  year          :integer          not null
#  term          :string(255)      not null
#  wday          :integer          not null
#  period        :integer          not null
#  grade         :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :timetable do
    year { Time.now.year }
    term Settings.timetable.term[0]
    wday { Time.now.wday }
    period { Faker::Number.digit.to_i + 1 }
    grade { Faker::Number.digit.to_i + 1 }
  end
end
