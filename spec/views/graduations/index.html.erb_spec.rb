require 'spec_helper'

describe "graduations/index" do
  before(:each) do
    assign(:graduations, [
      stub_model(Graduation,
        :name => "Name",
        :order => 1,
        :price => 2,
        :active => false
      ),
      stub_model(Graduation,
        :name => "Name",
        :order => 1,
        :price => 2,
        :active => false
      )
    ])
  end

  it "renders a list of graduations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
