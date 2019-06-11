require 'rails_helper'

RSpec.describe "Customers::Parts", type: :request do
  describe "GET /customers/parts" do
    it "works! (now write some real specs)" do
      get customer_parts_path
      expect(response).to have_http_status(200)
    end
  end
end
