# == Schema Information
#
# Table name: lecturers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Lecturer do
  describe 'association' do
    context 'with lecture' do
      let!(:lecture) { create(:proper_lecture) }
      let!(:lecturer) { create(:lecturer) }
      before :each do
        lecturer.lectures << lecture
      end

      it 'is valid' do
        expect(lecturer.lectures).to include(lecture)
      end
    end
  end
end
