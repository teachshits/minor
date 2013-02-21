require 'spec_helper'

describe "business_workdays/show" do
  before(:each) do
    @business_workday = assign(:business_workday, stub_model(BusinessWorkday,
      :business_id => 1,
      :period_id => 2,
      :Mon => 3,
      :Tue => 4,
      :Wed => 5,
      :Thu => 6,
      :Fri => 7,
      :Sat => 8,
      :Sun => 9
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
    rendered.should match(/9/)
  end
end
