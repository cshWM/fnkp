require 'spec_helper'

describe "coach_paths/index" do
  before(:each) do
    assign(:coach_paths, [
      stub_model(CoachPath,
        :coach_category => nil,
        :coach => nil
      ),
      stub_model(CoachPath,
        :coach_category => nil,
        :coach => nil
      )
    ])
  end

  it "renders a list of coach_paths" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
