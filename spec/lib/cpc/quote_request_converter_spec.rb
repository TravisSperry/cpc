require 'rails_helper'

RSpec.describe CPC::QuoteRequestConverter do
  subject { described_class.new }
  let(:quote_request) { create(:quote_request) }

  describe '.convert' do
    before do
      expect(described_class).to receive(:new).and_return(subject)
    end

    it 'calls #convert' do
      expect(subject).to receive(:convert).with(quote_request)

      described_class.convert(quote_request)
    end
  end

  describe '#convert' do
    subject { super().convert(quote_request) }

    it 'creates a WorkOrder' do
      expect{ subject }
        .to change{ WorkOrder.count }
        .by(+1)
    end

    it 'returns a WordOrder' do
      expect(subject).to be_kind_of WorkOrder
    end

    context 'when receiving a invalid quote request' do
      let(:quote_request) { :foo }

      it 'does not create a Workorder' do
        expect{ subject }.to raise_error(ActiveRecord::AssociationTypeMismatch)
      end
    end
  end
end
