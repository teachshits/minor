require 'spec_helper'

describe "avaliability_items/index" do
  before(:each) do
    assign(:avaliability_items, [
      stub_model(AvaliabilityItem,
        :avaliability_id => 1,
        :day => 2,
        :type => 3
      ),
      stub_model(AvaliabilityItem,
        :avaliability_id => 1,
        :day => 2,
        :type => 3
      )
    ])
  end

  it "renders a list of avaliability_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
