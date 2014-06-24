require 'spec_helper'

describe "coach_paths/show" do
  before(:each) do
    @coach_path = assign(:coach_path, stub_model(CoachPath,
      :coach_category => nil,
      :coach => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
