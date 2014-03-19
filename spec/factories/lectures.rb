# == Schema Information
#
# Table name: lectures
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  required_selective :string(255)      not null
#  divide             :string(255)      not null
#  term               :string(255)      not null
#  credit             :integer          not null
#  category           :string(255)
#  abstract           :text
#  failure_absence    :text
#  evaluation         :text
#  textbooks          :text
#  created_at         :datetime
#  updated_at         :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lecture do
    title "Computer Programming I"
    required_selective { Faker::Lorem.word }
    divide { Faker::Lorem.word }
    term { Faker::Lorem.word }
    credit 1
    category { Faker::Lorem.word }
    abstract { Faker::Lorem.paragraph }
    failure_absence { Faker::Lorem.paragraph }
    evaluation { Faker::Lorem.paragraph }
    textbooks { Faker::Lorem.paragraph }
  end
end
