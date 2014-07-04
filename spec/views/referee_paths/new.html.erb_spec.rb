require 'spec_helper'

describe "referee_paths/new" do
  before(:each) do
    assign(:referee_path, stub_model(RefereePath,
      :referee_category => nil,
      :referee => nil
    ).as_new_record)
  end

  it "renders new referee_path form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", referee_paths_path, "post" do
      assert_select "input#referee_path_referee_category[name=?]", "referee_path[referee_category]"
      assert_select "input#referee_path_referee[name=?]", "referee_path[referee]"
    end
  end
end
