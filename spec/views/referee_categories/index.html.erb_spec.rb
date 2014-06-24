require 'spec_helper'

describe "referee_categories/index" do
  before(:each) do
    assign(:referee_categories, [
      stub_model(RefereeCategory,
        :name => "Name",
        :order => 1,
        :active => false
      ),
      stub_model(RefereeCategory,
        :name => "Name",
        :order => 1,
        :active => false
      )
    ])
  end

  it "renders a list of referee_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
