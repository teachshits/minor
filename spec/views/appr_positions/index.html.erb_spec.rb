require 'spec_helper'

describe "appr_positions/index" do
  before(:each) do
    assign(:appr_positions, [
      stub_model(ApprPosition,
        :position_id => 1,
        :Mon => 2,
        :Tue => 3,
        :Wed => 4,
        :Thu => 5,
        :Fri => 6,
        :Sat => 7,
        :Sun => 8
      ),
      stub_model(ApprPosition,
        :position_id => 1,
        :Mon => 2,
        :Tue => 3,
        :Wed => 4,
        :Thu => 5,
        :Fri => 6,
        :Sat => 7,
        :Sun => 8
      )
    ])
  end

  it "renders a list of appr_positions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
  end
end
