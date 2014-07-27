require 'spec_helper'

describe "club_fees/index" do
  before(:each) do
    assign(:club_fees, [
      stub_model(ClubFee,
        :name => "Name",
        :valid_year => 1,
        :value => "9.99",
        :active => false
      ),
      stub_model(ClubFee,
        :name => "Name",
        :valid_year => 1,
        :value => "9.99",
        :active => false
      )
    ])
  end

  it "renders a list of club_fees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
