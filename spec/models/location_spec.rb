# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Location do
  describe 'association' do
    context 'with timetable' do
      let!(:location) { create(:location) }
      let!(:timetable) { create(:proper_timetable) }
      before(:each) { location.timetables << timetable }
      it 'is valid' do
        expect(location.timetables).to include timetable
      end
    end
  end
end
