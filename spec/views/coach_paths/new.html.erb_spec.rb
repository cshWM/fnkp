require 'spec_helper'

describe "coach_paths/new" do
  before(:each) do
    assign(:coach_path, stub_model(CoachPath,
      :coach_category => nil,
      :coach => nil
    ).as_new_record)
  end

  it "renders new coach_path form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", coach_paths_path, "post" do
      assert_select "input#coach_path_coach_category[name=?]", "coach_path[coach_category]"
      assert_select "input#coach_path_coach[name=?]", "coach_path[coach]"
    end
  end
end
