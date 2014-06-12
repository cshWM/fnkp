require 'spec_helper'

describe "association_fee_issues/edit" do
  before(:each) do
    @association_fee_issue = assign(:association_fee_issue, stub_model(AssociationFeeIssue,
      :associationfee => nil,
      :association => nil,
      :value => "9.99",
      :valid_year => 1
    ))
  end

  it "renders the edit association_fee_issue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", association_fee_issue_path(@association_fee_issue), "post" do
      assert_select "input#association_fee_issue_associationfee[name=?]", "association_fee_issue[associationfee]"
      assert_select "input#association_fee_issue_association[name=?]", "association_fee_issue[association]"
      assert_select "input#association_fee_issue_value[name=?]", "association_fee_issue[value]"
      assert_select "input#association_fee_issue_valid_year[name=?]", "association_fee_issue[valid_year]"
    end
  end
end
