require 'spec_helper'

describe "ApprPositions" do
  describe "GET /appr_positions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get appr_positions_path
      response.status.should be(200)
    end
  end
end
