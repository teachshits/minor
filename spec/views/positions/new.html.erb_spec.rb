require 'spec_helper'

describe "positions/new" do
  before(:each) do
    assign(:position, stub_model(Position,
      :pos => "MyString",
      :pos_id => 1,
      :employee_id => 1
    ).as_new_record)
  end

  it "renders new position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => positions_path, :method => "post" do
      assert_select "input#position_pos", :name => "position[pos]"
      assert_select "input#position_pos_id", :name => "position[pos_id]"
      assert_select "input#position_employee_id", :name => "position[employee_id]"
    end
  end
end
