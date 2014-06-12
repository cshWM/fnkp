require 'spec_helper'

describe "association_fee_issues/index" do
  before(:each) do
    assign(:association_fee_issues, [
      stub_model(AssociationFeeIssue,
        :associationfee => nil,
        :association => nil,
        :value => "9.99",
        :valid_year => 1
      ),
      stub_model(AssociationFeeIssue,
        :associationfee => nil,
        :association => nil,
        :value => "9.99",
        :valid_year => 1
      )
    ])
  end

  it "renders a list of association_fee_issues" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
