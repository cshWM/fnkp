require 'spec_helper'

describe "referee_paths/show" do
  before(:each) do
    @referee_path = assign(:referee_path, stub_model(RefereePath,
      :referee_category => nil,
      :referee => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
