require 'spec_helper'

describe "districts/index" do
  before(:each) do
    assign(:districts, [
      stub_model(District,
        :name => "Name",
        :active => false,
        :region => nil
      ),
      stub_model(District,
        :name => "Name",
        :active => false,
        :region => nil
      )
    ])
  end

  it "renders a list of districts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
