require "rails_helper"

RSpec.describe TrackingEntriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/tracking_entries").to route_to("tracking_entries#index")
    end

    it "routes to #new" do
      expect(:get => "/tracking_entries/new").to route_to("tracking_entries#new")
    end

    it "routes to #show" do
      expect(:get => "/tracking_entries/1").to route_to("tracking_entries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tracking_entries/1/edit").to route_to("tracking_entries#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tracking_entries").to route_to("tracking_entries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tracking_entries/1").to route_to("tracking_entries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tracking_entries/1").to route_to("tracking_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tracking_entries/1").to route_to("tracking_entries#destroy", :id => "1")
    end
  end
end
