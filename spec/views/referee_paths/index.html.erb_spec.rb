require 'spec_helper'

describe "referee_paths/index" do
  before(:each) do
    assign(:referee_paths, [
      stub_model(RefereePath,
        :referee_category => nil,
        :referee => nil
      ),
      stub_model(RefereePath,
        :referee_category => nil,
        :referee => nil
      )
    ])
  end

  it "renders a list of referee_paths" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
