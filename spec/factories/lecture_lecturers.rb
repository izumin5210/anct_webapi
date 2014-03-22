# == Schema Information
#
# Table name: lecture_lecturers
#
#  id          :integer          not null, primary key
#  lecture_id  :integer          not null
#  lecturer_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lecture_lecturer do
    lecture_id { Faker::Number.digit }
    lecturer_id { Faker::Number.digit }
  end
end
