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
    context 'with timetable' do
      let!(:department) { create(:department) }
      let!(:timetable) do
        build(:timetable).tap { |t| t.lecture_id = create(:lecture).id }
      end
      before(:each) { department.timetables << timetable }

      it 'is valid' do
        expect(department.timetables).to include timetable
      end
    end

    context 'with lecture' do
      let!(:department) { create(:department) }
      let!(:lecture) { create(:lecture) }
      before :each do
        department.timetables << build(:timetable).tap { |t| t.lecture_id = lecture.id }
      end

      it 'is valid' do
        expect(department.lectures).to include lecture
      end
    end
  end
end
