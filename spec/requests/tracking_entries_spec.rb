require 'rails_helper'

RSpec.describe "TrackingEntries", type: :request do
  describe "GET /tracking_entries" do
    it "works! (now write some real specs)" do
      get tracking_entries_path
      expect(response).to have_http_status(200)
    end
  end
end
