require 'spec_helper'

describe "RefereePaths" do
  describe "GET /referee_paths" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get referee_paths_path
      response.status.should be(200)
    end
  end
end
