# == Schema Information
#
# Table name: lectures
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  required_selective :string(255)      not null
#  divide             :string(255)      not null
#  term               :string(255)      not null
#  credit             :integer          not null
#  category           :string(255)
#  abstract           :text
#  failure_absence    :text
#  evaluation         :text
#  textbooks          :text
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Lecture do
  describe 'association' do
    context 'with timetable' do
      let!(:lecture) { create(:lecture) }
      let!(:timetable) do
        build(:timetable).tap { |t| t.department_id = create(:department).id }
      end
      before(:each) { lecture.timetables << timetable }

      it 'is valid' do
        expect(lecture.timetables).to include timetable
      end
    end

    context 'with lecturer' do
      let!(:lecture) { create(:lecture) }
      let!(:lecturer) { build(:lecturer) }
      before(:each) { lecture.lecturers << lecturer }

      it 'is valid' do
        expect(lecture.lecturers).to include lecturer
      end
    end

    context 'with department' do
      let!(:lecture) { create(:lecture) }
      let!(:department) { create(:department) }
      before :each do
        lecture.timetables << build(:timetable).tap { |t| t.department_id = department.id }
      end

      it 'is valid' do
        expect(lecture.departments).to include department
      end
    end

    context 'with course' do
      let!(:lecture) { create(:lecture) }
      let!(:course) { create(:course) }
      before :each do
        timetable = build(:timetable).tap do |t|
          t.department_id = create(:department).id
          t.course_id = course.id
        end
        lecture.timetables << timetable
      end

      it 'is valid' do
        expect(lecture.courses).to include course
      end
    end

    context 'with contact' do
      let!(:lecture) { create(:lecture) }
      let!(:contact) { build(:contact) }
      before(:each) { lecture.contacts << contact }

      it 'is valid' do
        expect(lecture.contacts).to include contact
      end
    end

    context 'with plan' do
      let!(:lecture) { create(:lecture) }
      let!(:plan) { build(:plan) }
      before(:each) { lecture.plans << plan }

      it 'is valid' do
        expect(lecture.plans).to include plan
      end
    end
  end
end
