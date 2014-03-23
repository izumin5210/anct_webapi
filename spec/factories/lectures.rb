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
#  grade              :integer          not null
#  department_id      :integer          not null
#  course_id          :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lecture do
    title "Computer Programming I"
    required_selective Settings.lecture.required_selective[0]
    divide Settings.lecture.divide[0]
    term Settings.lecture.term[0]
    credit 1
    category { Faker::Lorem.word }
    abstract { Faker::Lorem.paragraph }
    failure_absence { Faker::Lorem.paragraph }
    evaluation { Faker::Lorem.paragraph }
    textbooks { Faker::Lorem.paragraph }
    grade { Faker::Number.digit.to_i + 1}

    factory :proper_lecture do
      department { FactoryGirl.create(:department) }
    end
  end
end
