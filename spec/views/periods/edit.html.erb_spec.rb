require 'spec_helper'

describe "periods/edit" do
  before(:each) do
    @period = assign(:period, stub_model(Period,
      :p_start => ""
    ))
  end

  it "renders the edit period form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => periods_path(@period), :method => "post" do
      assert_select "input#period_p_start", :name => "period[p_start]"
    end
  end
end
