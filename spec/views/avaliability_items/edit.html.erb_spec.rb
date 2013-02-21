require 'spec_helper'

describe "avaliability_items/edit" do
  before(:each) do
    @avaliability_item = assign(:avaliability_item, stub_model(AvaliabilityItem,
      :avaliability_id => 1,
      :day => 1,
      :type => 1
    ))
  end

  it "renders the edit avaliability_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => avaliability_items_path(@avaliability_item), :method => "post" do
      assert_select "input#avaliability_item_avaliability_id", :name => "avaliability_item[avaliability_id]"
      assert_select "input#avaliability_item_day", :name => "avaliability_item[day]"
      assert_select "input#avaliability_item_type", :name => "avaliability_item[type]"
    end
  end
end
