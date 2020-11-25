require 'rails_helper'

RSpec.describe "ServiceTrackings", type: :request do
  describe "GET /service_trackings" do
    it "works! (now write some real specs)" do
      get service_trackings_path
      expect(response).to have_http_status(200)
    end
  end
end
