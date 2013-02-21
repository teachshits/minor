require 'spec_helper'

describe "avaliabilities/new" do
  before(:each) do
    assign(:avaliability, stub_model(Avaliability,
      :employee_id => 1,
      :name => "MyString",
      :description => "MyString",
      :ongoing => false,
      :repeat => 1
    ).as_new_record)
  end

  it "renders new avaliability form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => avaliabilities_path, :method => "post" do
      assert_select "input#avaliability_employee_id", :name => "avaliability[employee_id]"
      assert_select "input#avaliability_name", :name => "avaliability[name]"
      assert_select "input#avaliability_description", :name => "avaliability[description]"
      assert_select "input#avaliability_ongoing", :name => "avaliability[ongoing]"
      assert_select "input#avaliability_repeat", :name => "avaliability[repeat]"
    end
  end
end
