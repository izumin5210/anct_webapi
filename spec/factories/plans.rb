# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  lecture_id :integer          not null
#  number     :integer          not null
#  title      :string(255)
#  detail     :text
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plan do
    number { Faker::Number.digit }
    title { Faker::Lorem.sentence }
    detail { Faker::Lorem.paragraph }
  end
end
