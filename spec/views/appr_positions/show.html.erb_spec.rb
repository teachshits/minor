require 'spec_helper'

describe "appr_positions/show" do
  before(:each) do
    @appr_position = assign(:appr_position, stub_model(ApprPosition,
      :position_id => 1,
      :Mon => 2,
      :Tue => 3,
      :Wed => 4,
      :Thu => 5,
      :Fri => 6,
      :Sat => 7,
      :Sun => 8
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/8/)
  end
end
