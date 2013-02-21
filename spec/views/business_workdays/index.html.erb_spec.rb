require 'spec_helper'

describe "business_workdays/index" do
  before(:each) do
    assign(:business_workdays, [
      stub_model(BusinessWorkday,
        :business_id => 1,
        :period_id => 2,
        :Mon => 3,
        :Tue => 4,
        :Wed => 5,
        :Thu => 6,
        :Fri => 7,
        :Sat => 8,
        :Sun => 9
      ),
      stub_model(BusinessWorkday,
        :business_id => 1,
        :period_id => 2,
        :Mon => 3,
        :Tue => 4,
        :Wed => 5,
        :Thu => 6,
        :Fri => 7,
        :Sat => 8,
        :Sun => 9
      )
    ])
  end

  it "renders a list of business_workdays" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
  end
end
