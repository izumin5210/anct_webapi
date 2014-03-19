# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  abbr       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Course do

  it 'is valid w/ a name & a abbreviation' do
    expect(build(:course)).to be_valid
  end

  it 'is invalid w/o a name' do
    expect(build(:course, name: nil)).to have(1).errors_on(:name)
  end

  it 'is invalid w/o a abbreviation' do
    expect(build(:course, abbr: nil)).to have(1).errors_on(:abbr)
  end

  it 'is invalid w/ a duplicate name' do
    create(:course)
    expect(build(:course, abbr: 'd')).to have(1).errors_on(:name)
  end

  it 'is invalid w/ a duplicate abbreviation' do
    create(:course)
    expect(build(:course, name: 'Electrical Engineering Course')).to have(1).errors_on(:abbr)
  end
end
