# == Schema Information
#
# Table name: lecture_contacts
#
#  id         :integer          not null, primary key
#  lecture_id :integer          not null
#  contact_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lecture_contact do
    lecture_id { Faker::Number.digit }
    contact_id { Faker::Number.digit }
  end
end
