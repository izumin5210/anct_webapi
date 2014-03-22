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
    let!(:lecture) { create(:lecture) }
    let!(:lecturer) { create(:lecturer) }
    before :each do
      lecture.lecturers << lecturer
    end

    it 'have the lecturer' do
      expect(lecture.lecturers).to include(lecturer)
    end
  end
end
