require 'spec_helper'

describe "periods/index" do
  before(:each) do
    assign(:periods, [
      stub_model(Period,
        :p_start => ""
      ),
      stub_model(Period,
        :p_start => ""
      )
    ])
  end

  it "renders a list of periods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
