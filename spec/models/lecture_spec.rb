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

require 'spec_helper'

describe Lecture do

  it 'is valid w/ a title, required selective, devide, term, credit' do
    expect(build(:lecture)).to be_valid
  end

  it 'is invalid w/o a title' do
    expect(build(:lecture, title: nil)).to have(1).errors_on(:title)
  end

  it 'is invalid w/o a required selective' do
    expect(build(:lecture, required_selective: nil)).to have(1).errors_on(:required_selective)
  end

  it 'is invalid w/o a divide' do
    expect(build(:lecture, divide: nil)).to have(1).errors_on(:divide)
  end

  it 'is invalid w/o a term' do
    expect(build(:lecture, term: nil)).to have(1).errors_on(:term)
  end

  it 'is invalid w/o a credit' do
    expect(build(:lecture, credit: nil)).to have(1).errors_on(:credit)
  end

end
