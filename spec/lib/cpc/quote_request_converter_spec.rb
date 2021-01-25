require 'rails_helper'

RSpec.describe Cpc::QuoteRequestConverter do
  subject(:quote_request_converter) { described_class.new }

  let(:quote_request) { create(:quote_request, customer: customer) }
  let(:customer) { create(:customer, :company_type) }

  describe '.convert!' do
    before do
      allow(described_class).to receive(:new).and_return(quote_request_converter)
    end

    it 'calls #convert' do
      expect(quote_request_converter).to receive(:convert!).with(quote_request)

      described_class.convert!(quote_request)
    end
  end

  describe '#convert' do
    subject { super().convert!(quote_request) }

    it 'creates a WorkOrder' do
      expect { quote_request_converter.convert!(quote_request) }
        .to change{ WorkOrder.count }
        .by(+1)
    end

    it 'returns a WordOrder' do
      expect(quote_request_converter.convert!(quote_request))
        .is_a? WorkOrder
    end

    context 'when receiving a invalid quote request' do
      let(:quote_request) { :foo }

      it 'does not create a Workorder' do
        expect{ quote_request_converter.convert!(quote_request) }
          .to raise_error(ActiveRecord::AssociationTypeMismatch)
      end
    end
  end
end
