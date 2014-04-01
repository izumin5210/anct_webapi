require 'spec_helper'

describe Api::V1::TimetablesController do

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe 'GET #index' do
    it 'returns http success(200 OK)'
    it 'assigns the requested timetables to @timetables'
  end

  describe 'GET #show' do
    it 'returns http success(200 OK)'
    it 'assigns the requested timetable to @timetable'
  end
end
