require 'spec_helper'

describe Api::V1::LecturesController do

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe 'GET #index' do
    it 'returns http success(200 OK)'
  end

  describe 'GET #show' do

    context 'with valid id' do
      let(:lecture) { create(:proper_lecture) }
      before(:each) { get :show, id: lecture }

      it 'returns http success(200 OK)' do
        expect(response).to be_success
        expect(response.status).to eq 200
      end

      it 'assigns the requested lecture to @lecture' do
        expect(assigns(:lecture)).to eq lecture
      end
    end

    context 'with invalid id' do
      it 'returns 404 not found'
    end
  end

end
