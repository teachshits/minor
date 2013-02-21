require "spec_helper"

describe BusinessWorkdaysController do
  describe "routing" do

    it "routes to #index" do
      get("/business_workdays").should route_to("business_workdays#index")
    end

    it "routes to #new" do
      get("/business_workdays/new").should route_to("business_workdays#new")
    end

    it "routes to #show" do
      get("/business_workdays/1").should route_to("business_workdays#show", :id => "1")
    end

    it "routes to #edit" do
      get("/business_workdays/1/edit").should route_to("business_workdays#edit", :id => "1")
    end

    it "routes to #create" do
      post("/business_workdays").should route_to("business_workdays#create")
    end

    it "routes to #update" do
      put("/business_workdays/1").should route_to("business_workdays#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/business_workdays/1").should route_to("business_workdays#destroy", :id => "1")
    end

  end
end
