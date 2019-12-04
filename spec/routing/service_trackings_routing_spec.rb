require "rails_helper"

RSpec.describe ServiceTrackingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/service_trackings").to route_to("service_trackings#index")
    end

    it "routes to #new" do
      expect(:get => "/service_trackings/new").to route_to("service_trackings#new")
    end

    it "routes to #show" do
      expect(:get => "/service_trackings/1").to route_to("service_trackings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/service_trackings/1/edit").to route_to("service_trackings#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/service_trackings").to route_to("service_trackings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/service_trackings/1").to route_to("service_trackings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/service_trackings/1").to route_to("service_trackings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/service_trackings/1").to route_to("service_trackings#destroy", :id => "1")
    end
  end
end
