require 'rails_helper'

RSpec.describe 'QuoteRequestConversions', type: :request do
  let(:quote_request) { create(:quote_request, user: user) }
  let(:user) { create(:user, :internal) }

  before do
    sign_in user
  end

  describe 'POST /quote_request_conversions' do
    subject do
      post quote_request_conversions_path,
           params: { quote_request_id: quote_request.id }
    end

    it 'creates a work order' do
      expect{ subject }.to change{ WorkOrder.count }.by(+1)
    end

    it { is_expected.to redirect_to work_order_path(WorkOrder.first)}
  end
end
