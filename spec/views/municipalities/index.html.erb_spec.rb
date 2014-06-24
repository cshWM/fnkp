require 'spec_helper'

describe "municipalities/index" do
  before(:each) do
    assign(:municipalities, [
      stub_model(Municipality,
        :name => "Name",
        :district => nil,
        :active => false
      ),
      stub_model(Municipality,
        :name => "Name",
        :district => nil,
        :active => false
      )
    ])
  end

  it "renders a list of municipalities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
