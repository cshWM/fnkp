require 'spec_helper'

describe "club_fee_issues/show" do
  before(:each) do
    @club_fee_issue = assign(:club_fee_issue, stub_model(ClubFeeIssue,
      :club_fee => nil,
      :club => nil,
      :value => "9.99",
      :valid_year => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
  end
end
