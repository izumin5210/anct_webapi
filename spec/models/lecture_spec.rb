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
    context 'with lecturer' do
      let!(:lecture) { create(:lecture) }
      let!(:lecturer) { create(:lecturer) }
      before :each do
        lecture.lecturers << lecturer
      end

      it 'is valid' do
        expect(lecture.lecturers).to include(lecturer)
      end
    end

    context 'with contact' do
      let!(:lecture) { create(:lecture) }
      let!(:contact) { create(:contact) }
      before :each do
        lecture.contacts << contact
      end

      it 'is valid' do
        expect(lecture.contacts).to include(contact)
      end
    end

    context 'with plan' do
      let!(:lecture) { create(:lecture) }
      let!(:plan) { create(:plan) }
      before :each do
        lecture.plans << plan
      end

      it 'is valid' do
        expect(lecture.plans).to include(plan)
      end
    end
  end
end
