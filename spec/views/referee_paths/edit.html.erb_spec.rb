require 'spec_helper'

describe "referee_paths/edit" do
  before(:each) do
    @referee_path = assign(:referee_path, stub_model(RefereePath,
      :referee_category => nil,
      :referee => nil
    ))
  end

  it "renders the edit referee_path form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", referee_path_path(@referee_path), "post" do
      assert_select "input#referee_path_referee_category[name=?]", "referee_path[referee_category]"
      assert_select "input#referee_path_referee[name=?]", "referee_path[referee]"
    end
  end
end
