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
    let(:timetable) { create(:proper_timetable) }
    before(:each) { get :show, id: timetable }

    context 'with valid id' do
      it 'returns http success(200 OK)' do
        # TODO: FactoryGirlで謎の無限ループが起きてる
        expect(response).to be_success
        expect(response.status).to eq 200
      end

      it 'assigns the requested timetable to @timetable' do
        expect(assigns(:timetable)).to eq timetable
      end
    end

    context 'with invalid id' do
      it 'returns 404 not found' do
        get :show, id: 65536
        expect(response.status).to eq 404
      end
    end
  end
end
