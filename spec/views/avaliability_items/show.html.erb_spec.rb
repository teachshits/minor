require 'spec_helper'

describe "avaliability_items/show" do
  before(:each) do
    @avaliability_item = assign(:avaliability_item, stub_model(AvaliabilityItem,
      :avaliability_id => 1,
      :day => 2,
      :type => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
