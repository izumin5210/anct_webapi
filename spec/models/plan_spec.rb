# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  lecture_id :integer          not null
#  number     :integer          not null
#  title      :string(255)
#  detail     :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Plan do
  describe 'association' do
    let!(:lecture) { create(:proper_lecture) }
    let!(:plan) { build(:plan) }

    context 'with lecture' do
      before(:each) { plan.lecture = lecture }
      it 'is valid' do
        expect(plan.lecture).to eq lecture
      end
    end
  end
 end
