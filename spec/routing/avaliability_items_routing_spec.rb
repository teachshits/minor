require "spec_helper"

describe AvaliabilityItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/avaliability_items").should route_to("avaliability_items#index")
    end

    it "routes to #new" do
      get("/avaliability_items/new").should route_to("avaliability_items#new")
    end

    it "routes to #show" do
      get("/avaliability_items/1").should route_to("avaliability_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/avaliability_items/1/edit").should route_to("avaliability_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/avaliability_items").should route_to("avaliability_items#create")
    end

    it "routes to #update" do
      put("/avaliability_items/1").should route_to("avaliability_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/avaliability_items/1").should route_to("avaliability_items#destroy", :id => "1")
    end

  end
end
