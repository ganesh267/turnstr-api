require "rails_helper"

RSpec.describe V1::Admin::UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/admins").to route_to("v1/admins#index")
    end

    it "routes to #new" do
      expect(:get => "/v1/admins/new").to route_to("v1/admins#new")
    end

    it "routes to #show" do
      expect(:get => "/v1/admins/1").to route_to("v1/admins#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/v1/admins/1/edit").to route_to("v1/admins#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/v1/admins").to route_to("v1/admins#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/admins/1").to route_to("v1/admins#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/admins/1").to route_to("v1/admins#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/admins/1").to route_to("v1/admins#destroy", :id => "1")
    end

  end
end
