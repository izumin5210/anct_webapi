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
#  grade              :integer          not null
#  department_id      :integer          not null
#  course_id          :integer
#

require 'spec_helper'

describe Lecture do
  describe 'association' do
    let!(:lecture) { build(:lecture) }
    let!(:timetable) { build(:timetable) }
    let!(:department) { create(:department) }
    let!(:course) { create(:course) }
    let!(:lecturer) { create(:lecturer) }
    let!(:contact) { create(:contact) }
    let!(:plan) { build(:plan) }

    context 'with timetable' do
      before(:each) { lecture.timetables << timetable }
      it 'is valid' do
        expect(lecture.timetables).to include timetable
      end
    end

    context 'with lecturer' do
      before(:each) { lecture.lecturers << lecturer }
      it 'is valid' do
        expect(lecture.lecturers).to include lecturer
      end
    end

    context 'with department' do
      before(:each) { lecture.department = department }
      it 'is valid' do
        expect(lecture.department).to eq department
      end
    end

    context 'with course' do
      before(:each) { lecture.course = course }
      it 'is valid' do
        expect(lecture.course).to eq course
      end
    end

    context 'with contact' do
      before(:each) { lecture.contacts << contact }
      it 'is valid' do
        expect(lecture.contacts).to include contact
      end
    end

    context 'with plan' do
      before(:each) { lecture.plans << plan }
      it 'is valid' do
        expect(lecture.plans).to include plan
      end
    end
  end
end
