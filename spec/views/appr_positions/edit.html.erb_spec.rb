require 'spec_helper'

describe "appr_positions/edit" do
  before(:each) do
    @appr_position = assign(:appr_position, stub_model(ApprPosition,
      :position_id => 1,
      :Mon => 1,
      :Tue => 1,
      :Wed => 1,
      :Thu => 1,
      :Fri => 1,
      :Sat => 1,
      :Sun => 1
    ))
  end

  it "renders the edit appr_position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appr_positions_path(@appr_position), :method => "post" do
      assert_select "input#appr_position_position_id", :name => "appr_position[position_id]"
      assert_select "input#appr_position_Mon", :name => "appr_position[Mon]"
      assert_select "input#appr_position_Tue", :name => "appr_position[Tue]"
      assert_select "input#appr_position_Wed", :name => "appr_position[Wed]"
      assert_select "input#appr_position_Thu", :name => "appr_position[Thu]"
      assert_select "input#appr_position_Fri", :name => "appr_position[Fri]"
      assert_select "input#appr_position_Sat", :name => "appr_position[Sat]"
      assert_select "input#appr_position_Sun", :name => "appr_position[Sun]"
    end
  end
end
