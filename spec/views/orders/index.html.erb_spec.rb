require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :name => "Name",
        :total_value => "9.99",
        :state => "State",
        :has_many => ""
      ),
      stub_model(Order,
        :name => "Name",
        :total_value => "9.99",
        :state => "State",
        :has_many => ""
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
