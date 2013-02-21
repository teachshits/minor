require 'spec_helper'

describe "avaliability_items/new" do
  before(:each) do
    assign(:avaliability_item, stub_model(AvaliabilityItem,
      :avaliability_id => 1,
      :day => 1,
      :type => 1
    ).as_new_record)
  end

  it "renders new avaliability_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => avaliability_items_path, :method => "post" do
      assert_select "input#avaliability_item_avaliability_id", :name => "avaliability_item[avaliability_id]"
      assert_select "input#avaliability_item_day", :name => "avaliability_item[day]"
      assert_select "input#avaliability_item_type", :name => "avaliability_item[type]"
    end
  end
end
