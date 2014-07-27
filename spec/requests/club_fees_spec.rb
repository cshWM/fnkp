require 'spec_helper'

describe "ClubFees" do
  describe "GET /club_fees" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get club_fees_path
      response.status.should be(200)
    end
  end
end
