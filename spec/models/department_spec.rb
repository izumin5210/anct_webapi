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

  describe 'association' do
    let!(:department) { create(:department) }
    let!(:lecture) { build(:lecture) }
    let!(:timetable) { build(:timetable) }
    before(:each) { department.lectures << lecture }

    context 'with lecture' do
      it 'is valid' do
        expect(department.lectures).to include lecture
      end
    end

    context 'with timetable' do
      before(:each) { lecture.timetables << timetable }
      it 'is valid' do
        expect(department.timetables).to include timetable
      end
    end
  end
end
