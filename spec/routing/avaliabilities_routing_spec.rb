require "spec_helper"

describe AvaliabilitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/avaliabilities").should route_to("avaliabilities#index")
    end

    it "routes to #new" do
      get("/avaliabilities/new").should route_to("avaliabilities#new")
    end

    it "routes to #show" do
      get("/avaliabilities/1").should route_to("avaliabilities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/avaliabilities/1/edit").should route_to("avaliabilities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/avaliabilities").should route_to("avaliabilities#create")
    end

    it "routes to #update" do
      put("/avaliabilities/1").should route_to("avaliabilities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/avaliabilities/1").should route_to("avaliabilities#destroy", :id => "1")
    end

  end
end
