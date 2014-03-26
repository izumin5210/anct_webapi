require 'spec_helper'

describe Api::V1::LecturesController do

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe 'GET #index' do
    it 'returns http success(200 OK)'
  end

  describe 'GET #show' do
    let!(:lecture) { create(:proper_lecture) }
    before(:each) { get :show, id: lecture }

    context 'with valid id' do
      it 'returns http success(200 OK)' do
        expect(response).to be_success
        expect(response.status).to eq 200
      end

      it 'returns lecture json', autodoc: true do
        expect(response.body).to have_json_path('lecture')
        expect(response.body).to be_json_eql(lecture.id).at_path('lecture/id')
        expect(response.body).to be_json_eql("\"#{lecture.title}\"").at_path('lecture/title')
        expect(response.body).to be_json_eql("\"#{lecture.required_selective}\"").at_path('lecture/required_selective')
        expect(response.body).to be_json_eql("\"#{lecture.divide}\"").at_path('lecture/divide')
        expect(response.body).to be_json_eql("\"#{lecture.term}\"").at_path('lecture/term')
        expect(response.body).to be_json_eql(lecture.credit).at_path('lecture/credit')
        expect(response.body).to be_json_eql("\"#{lecture.category}\"").at_path('lecture/category')
        expect(response.body).to be_json_eql("\"#{lecture.abstract}\"").at_path('lecture/abstract')
        expect(response.body).to be_json_eql("\"#{lecture.failure_absence}\"").at_path('lecture/failure_absence')
        expect(response.body).to be_json_eql("\"#{lecture.evaluation}\"").at_path('lecture/evaluation')
        expect(response.body).to be_json_eql("\"#{lecture.textbooks}\"").at_path('lecture/textbooks')
        expect(response.body).to be_json_eql(lecture.grade).at_path('lecture/grade')
        expect(response.body).to be_json_eql(lecture.department.id).at_path('lecture/department/id')
        expect(response.body).to be_json_eql("\"#{lecture.department.name}\"").at_path('lecture/department/name')
        expect(response.body).to be_json_eql("\"#{lecture.department.abbr}\"").at_path('lecture/department/abbr')
        expect(response.body).to be_json_eql(lecture.course.id).at_path('lecture/course/id')
        expect(response.body).to be_json_eql("\"#{lecture.course.name}\"").at_path('lecture/course/name')
        expect(response.body).to be_json_eql("\"#{lecture.course.abbr}\"").at_path('lecture/course/abbr')
        lecture.timetables.each.with_index do |timetable, i|
          expect(response.body).to be_json_eql(timetable.id).at_path("lecture/timetables/#{i}/id")
          expect(response.body).to be_json_eql(timetable.year).at_path("lecture/timetables/#{i}/year")
          expect(response.body).to be_json_eql("\"#{timetable.term}\"").at_path("lecture/timetables/#{i}/term")
          expect(response.body).to be_json_eql(timetable.wday).at_path("lecture/timetables/#{i}/wday")
          expect(response.body).to be_json_eql(timetable.period).at_path("lecture/timetables/#{i}/period")
          expect(response.body).to be_json_eql(timetable.location.id).at_path("lecture/timetables/#{i}/location/id")
          expect(response.body).to be_json_eql("\"#{timetable.location.name}\"").at_path("lecture/timetables/#{i}/location/name")
        end
        lecture.lecturers.each.with_index do |lecturer, i|
          expect(response.body).to be_json_eql(lecturer.id).at_path("lecture/lecturers/#{i}/id")
          expect(response.body).to be_json_eql("\"#{lecturer.name}\"").at_path("lecture/lecturers/#{i}/name")
        end
        lecture.contacts.each.with_index do |contact, i|
          expect(response.body).to be_json_eql(contact.id).at_path("lecture/contacts/#{i}/id")
          expect(response.body).to be_json_eql("\"#{contact.email}\"").at_path("lecture/contacts/#{i}/email")
        end
        lecture.plans.each.with_index do |plan, i|
          expect(response.body).to be_json_eql(plan.id).at_path("lecture/plans/#{i}/id")
          expect(response.body).to be_json_eql(plan.number).at_path("lecture/plans/#{i}/number")
          expect(response.body).to be_json_eql("\"#{plan.title}\"").at_path("lecture/plans/#{i}/title")
          expect(response.body).to be_json_eql("\"#{plan.detail}\"").at_path("lecture/plans/#{i}/detail")
        end
      end
    end

    context 'with invalid id' do
      it 'returns 404 not found'
    end
  end

end
