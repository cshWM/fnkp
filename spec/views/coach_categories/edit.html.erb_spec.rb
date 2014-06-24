require 'spec_helper'

describe "coach_categories/edit" do
  before(:each) do
    @coach_category = assign(:coach_category, stub_model(CoachCategory,
      :name => "MyString",
      :order => 1,
      :valid => false
    ))
  end

  it "renders the edit coach_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", coach_category_path(@coach_category), "post" do
      assert_select "input#coach_category_name[name=?]", "coach_category[name]"
      assert_select "input#coach_category_order[name=?]", "coach_category[order]"
      assert_select "input#coach_category_valid[name=?]", "coach_category[valid]"
    end
  end
end
