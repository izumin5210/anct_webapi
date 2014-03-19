# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  abbr       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Department do

  it 'is valid w/ a name & a abbreviation' do
    expect(build(:department)).to be_valid
  end

  it 'is invalid w/o a name' do
    expect(build(:department, name: nil)).to have(1).errors_on(:name)
  end

  it 'is invalid w/o a abbreviation' do
    expect(build(:department, abbr: nil)).to have(1).errors_on(:abbr)
  end

  it 'is invalid w/ a duplicate name' do
    create(:department)
    expect(build(:department, abbr: 'e')).to have(1).errors_on(:name)
  end
  
  it 'is invalid w/ a duplicate abbreviation' do
    create(:department)
    expect(build(:department, name: 'Civil Engineering')).to have(1).errors_on(:abbr)
  end
end
