# == Schema Information
#
# Table name: timetables
#
#  id            :integer          not null, primary key
#  lecture_id    :integer          not null
#  department_id :integer          not null
#  course_id     :integer
#  year          :integer          not null
#  term          :string(255)      not null
#  wday          :integer          not null
#  period        :integer          not null
#  grade         :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Timetable do
  describe 'association' do
    context 'with lecture' do
      let!(:lecture) { create(:lecture) }
      let!(:timetable) do
        build(:timetable).tap { |t| t.department_id = create(:department).id }
      end
      before :each do
        timetable.lecture = lecture
      end
      it 'is valid' do
        expect(timetable.lecture).to eq lecture
      end
    end

    context 'with department' do
      let!(:department) { create(:department) }
      let!(:timetable) do
        build(:timetable).tap do |t|
          t.lecture_id = create(:lecture).id
        end
      end
      before :each do
        timetable.department = department
      end
      it 'is valid' do
        expect(timetable.department).to eq department
      end
    end

    context 'with course' do
      let!(:course) { create(:course) }
      let!(:timetable) do
        build(:timetable).tap do |t|
          t.lecture_id = create(:lecture).id
          t.department_id = create(:department).id
        end
      end
      before :each do
        timetable.course = course
      end
      it 'is valid' do
        expect(timetable.course).to eq course
      end
    end
  end
end
