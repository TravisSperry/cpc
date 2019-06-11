require "rails_helper"

RSpec.describe Customers::PartsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/customers/parts").to route_to("customers/parts#index")
    end

    it "routes to #new" do
      expect(:get => "/customers/parts/new").to route_to("customers/parts#new")
    end

    it "routes to #show" do
      expect(:get => "/customers/parts/1").to route_to("customers/parts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/customers/parts/1/edit").to route_to("customers/parts#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/customers/parts").to route_to("customers/parts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/customers/parts/1").to route_to("customers/parts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/customers/parts/1").to route_to("customers/parts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/customers/parts/1").to route_to("customers/parts#destroy", :id => "1")
    end
  end
end
