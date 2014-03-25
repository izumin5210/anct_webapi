# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  email      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    email { Faker::Internet.email }
  end
end
