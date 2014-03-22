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
    let!(:lecture) { create(:lecture) }
    let!(:lecturer) { create(:lecturer) }
    before :each do
      lecturer.lectures << lecture
    end

    it 'have the lecture' do
      expect(lecturer.lectures).to include(lecture)
    end
  end

end
