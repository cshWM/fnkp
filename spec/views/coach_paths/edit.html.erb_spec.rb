require 'spec_helper'

describe "coach_paths/edit" do
  before(:each) do
    @coach_path = assign(:coach_path, stub_model(CoachPath,
      :coach_category => nil,
      :coach => nil
    ))
  end

  it "renders the edit coach_path form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", coach_path_path(@coach_path), "post" do
      assert_select "input#coach_path_coach_category[name=?]", "coach_path[coach_category]"
      assert_select "input#coach_path_coach[name=?]", "coach_path[coach]"
    end
  end
end
