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
    context 'with lecture' do
      let!(:lecture) { create(:lecture) }
      let!(:plan) { create(:plan) }
      before :each do
        plan.lecture = lecture
      end

      it 'is valid' do
        expect(plan.lecture).to eq lecture
      end
    end
  end
 end
