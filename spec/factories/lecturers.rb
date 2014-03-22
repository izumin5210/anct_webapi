# == Schema Information
#
# Table name: lecturers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lecturer do
    name { Faker::Name.name }
  end
end
