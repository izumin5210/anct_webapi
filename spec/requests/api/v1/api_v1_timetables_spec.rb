require 'spec_helper'

describe "Api::V1::Timetables" do

  describe "GET /api/v1/timetables" do
    it 'returns timetables json'
  end

  describe "GET /api/v1/timetables/:id" do
    let(:timetable) { create(:proper_timetable) }
    before(:each) { get "api/v1/timetables/#{timetable.id}" }

    it 'returns timetable json', autodoc: true do
      expect(response.body).to have_json_path('timetable')
      expect(response.body).to be_json_eql(timetable.id).at_path('timetable/id')
      expect(response.body).to be_json_eql(timetable.lecture_id).at_path('timetable/lectureId')
      expect(response.body).to be_json_eql(timetable.year).at_path('timetable/year')
      expect(response.body).to be_json_eql("\"#{timetable.term}\"").at_path('timetable/term')
      expect(response.body).to be_json_eql(timetable.wday).at_path('timetable/wday')
      expect(response.body).to be_json_eql(timetable.period).at_path('timetable/period')
      expect(response.body).to be_json_eql(timetable.location.id).at_path('timetable/location/id')
      expect(response.body).to be_json_eql("\"#{timetable.location.name}\"").at_path('timetable/location/name')
    end
  end
end
