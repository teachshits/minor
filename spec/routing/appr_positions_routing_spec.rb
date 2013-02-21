require "spec_helper"

describe ApprPositionsController do
  describe "routing" do

    it "routes to #index" do
      get("/appr_positions").should route_to("appr_positions#index")
    end

    it "routes to #new" do
      get("/appr_positions/new").should route_to("appr_positions#new")
    end

    it "routes to #show" do
      get("/appr_positions/1").should route_to("appr_positions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/appr_positions/1/edit").should route_to("appr_positions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/appr_positions").should route_to("appr_positions#create")
    end

    it "routes to #update" do
      put("/appr_positions/1").should route_to("appr_positions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/appr_positions/1").should route_to("appr_positions#destroy", :id => "1")
    end

  end
end
