# == Schema Information
#
# Table name: timetables
#
#  id          :integer          not null, primary key
#  lecture_id  :integer          not null
#  year        :integer          not null
#  term        :string(255)      not null
#  wday        :integer          not null
#  period      :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  location_id :integer
#

require 'spec_helper'

describe Timetable do
  describe 'association' do
    let!(:department) { create(:department) }
    let!(:course) { create(:course) }
    let!(:location) { create(:location) }
    let!(:lecture) do
      build(:lecture).tap do |l|
        l.department = department
        l.course = course
      end
    end
    let!(:timetable) { build(:timetable).tap { |t| t.lecture = lecture } }

    context 'with lecture' do
      it 'is valid' do
        expect(timetable.lecture).to eq lecture
      end
    end

    context 'with location' do
      before(:each) { timetable.location = location }
      it 'is valid' do
        expect(timetable.location).to eq location
      end
    end
  end
end
