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
    context 'with timetable' do
      let!(:course) { create(:course) }
      let!(:timetable) do
        build(:timetable).tap do |t|
          t.lecture_id = create(:lecture).id
          t.department_id = create(:department).id
        end
      end
      before(:each) { course.timetables << timetable }

      it 'is valid' do
        expect(course.timetables).to include timetable
      end
    end

    context 'with lecture' do
      let!(:course) { create(:course) }
      let!(:lecture) { create(:lecture) }
      before :each do
        timetable = build(:timetable).tap do |t|
          t.lecture_id = lecture.id
          t.department_id = create(:department).id
        end
        course.timetables << timetable
      end

      it 'is valid' do
        expect(course.lectures).to include lecture
      end
    end
  end
end
