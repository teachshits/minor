require 'spec_helper'

describe "business_workdays/edit" do
  before(:each) do
    @business_workday = assign(:business_workday, stub_model(BusinessWorkday,
      :business_id => 1,
      :period_id => 1,
      :Mon => 1,
      :Tue => 1,
      :Wed => 1,
      :Thu => 1,
      :Fri => 1,
      :Sat => 1,
      :Sun => 1
    ))
  end

  it "renders the edit business_workday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => business_workdays_path(@business_workday), :method => "post" do
      assert_select "input#business_workday_business_id", :name => "business_workday[business_id]"
      assert_select "input#business_workday_period_id", :name => "business_workday[period_id]"
      assert_select "input#business_workday_Mon", :name => "business_workday[Mon]"
      assert_select "input#business_workday_Tue", :name => "business_workday[Tue]"
      assert_select "input#business_workday_Wed", :name => "business_workday[Wed]"
      assert_select "input#business_workday_Thu", :name => "business_workday[Thu]"
      assert_select "input#business_workday_Fri", :name => "business_workday[Fri]"
      assert_select "input#business_workday_Sat", :name => "business_workday[Sat]"
      assert_select "input#business_workday_Sun", :name => "business_workday[Sun]"
    end
  end
end
