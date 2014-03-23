# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  email      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Contact do
  describe 'association' do
    let!(:lecture) { create(:proper_lecture) }
    let!(:contact) { create(:contact) }

    context 'with lecture' do
      before(:each) { contact.lectures << lecture }
      it 'is valid' do
        expect(contact.lectures).to include(lecture)
      end
    end
  end
end
