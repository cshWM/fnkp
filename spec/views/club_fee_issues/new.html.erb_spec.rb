require 'spec_helper'

describe "club_fee_issues/new" do
  before(:each) do
    assign(:club_fee_issue, stub_model(ClubFeeIssue,
      :club_fee => nil,
      :club => nil,
      :value => "9.99",
      :valid_year => 1
    ).as_new_record)
  end

  it "renders new club_fee_issue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", club_fee_issues_path, "post" do
      assert_select "input#club_fee_issue_club_fee[name=?]", "club_fee_issue[club_fee]"
      assert_select "input#club_fee_issue_club[name=?]", "club_fee_issue[club]"
      assert_select "input#club_fee_issue_value[name=?]", "club_fee_issue[value]"
      assert_select "input#club_fee_issue_valid_year[name=?]", "club_fee_issue[valid_year]"
    end
  end
end
