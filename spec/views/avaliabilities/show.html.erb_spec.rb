require 'spec_helper'

describe "avaliabilities/show" do
  before(:each) do
    @avaliability = assign(:avaliability, stub_model(Avaliability,
      :employee_id => 1,
      :name => "Name",
      :description => "Description",
      :ongoing => false,
      :repeat => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/false/)
    rendered.should match(/2/)
  end
end
