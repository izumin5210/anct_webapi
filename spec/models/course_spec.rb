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

  describe 'association' do
    let!(:course) { create(:course) }
    let!(:lecture) { build(:lecture).tap { |l| l.department = create(:department) } }
    let!(:timetable) { build(:timetable) }
    before(:each) { course.lectures << lecture }

    context 'with lecture' do
      it 'is valid' do
        expect(course.lectures).to include lecture
      end
    end

    context 'with timetable' do
      before(:each) { lecture.timetables << timetable }
      it 'is valid' do
        expect(course.timetables).to include timetable
      end
    end
  end
end
