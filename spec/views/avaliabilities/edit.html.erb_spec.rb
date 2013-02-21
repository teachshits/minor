require 'spec_helper'

describe "avaliabilities/edit" do
  before(:each) do
    @avaliability = assign(:avaliability, stub_model(Avaliability,
      :employee_id => 1,
      :name => "MyString",
      :description => "MyString",
      :ongoing => false,
      :repeat => 1
    ))
  end

  it "renders the edit avaliability form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => avaliabilities_path(@avaliability), :method => "post" do
      assert_select "input#avaliability_employee_id", :name => "avaliability[employee_id]"
      assert_select "input#avaliability_name", :name => "avaliability[name]"
      assert_select "input#avaliability_description", :name => "avaliability[description]"
      assert_select "input#avaliability_ongoing", :name => "avaliability[ongoing]"
      assert_select "input#avaliability_repeat", :name => "avaliability[repeat]"
    end
  end
end
