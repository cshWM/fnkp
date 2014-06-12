require 'spec_helper'

describe "AssociationFeeIssues" do
  describe "GET /association_fee_issues" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get association_fee_issues_path
      response.status.should be(200)
    end
  end
end
