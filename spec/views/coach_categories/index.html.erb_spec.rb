require 'spec_helper'

describe "coach_categories/index" do
  before(:each) do
    assign(:coach_categories, [
      stub_model(CoachCategory,
        :name => "Name",
        :order => 1,
        :valid => false
      ),
      stub_model(CoachCategory,
        :name => "Name",
        :order => 1,
        :valid => false
      )
    ])
  end

  it "renders a list of coach_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
