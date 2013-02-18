require 'spec_helper'

describe "positions/show" do
  before(:each) do
    @position = assign(:position, stub_model(Position,
      :pos => "Pos",
      :pos_id => 1,
      :employee_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pos/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
