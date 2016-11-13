require "rails_helper"

RSpec.describe Api::V1::BookmarksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1s").to route_to("api/v1s#index")
    end

    it "routes to #new" do
      expect(:get => "/api/v1s/new").to route_to("api/v1s#new")
    end

    it "routes to #show" do
      expect(:get => "/api/v1s/1").to route_to("api/v1s#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/v1s/1/edit").to route_to("api/v1s#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1s").to route_to("api/v1s#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1s/1").to route_to("api/v1s#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1s/1").to route_to("api/v1s#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1s/1").to route_to("api/v1s#destroy", :id => "1")
    end

  end
end
