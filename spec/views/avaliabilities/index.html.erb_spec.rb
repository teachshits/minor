require 'spec_helper'

describe "avaliabilities/index" do
  before(:each) do
    assign(:avaliabilities, [
      stub_model(Avaliability,
        :employee_id => 1,
        :name => "Name",
        :description => "Description",
        :ongoing => false,
        :repeat => 2
      ),
      stub_model(Avaliability,
        :employee_id => 1,
        :name => "Name",
        :description => "Description",
        :ongoing => false,
        :repeat => 2
      )
    ])
  end

  it "renders a list of avaliabilities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
