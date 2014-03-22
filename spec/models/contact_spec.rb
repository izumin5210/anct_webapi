require 'spec_helper'

describe Contact do
  describe 'association' do
    context 'with lecture' do
      let!(:lecture) { create(:lecture) }
      let!(:contact) { create(:contact) }
      before :each do
        contact.lectures << lecture
      end

      it 'is valid' do
        expect(contact.lectures).to include(lecture)
      end
    end
  end
end
