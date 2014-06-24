require 'spec_helper'

describe "referee_categories/new" do
  before(:each) do
    assign(:referee_category, stub_model(RefereeCategory,
      :name => "MyString",
      :order => 1,
      :active => false
    ).as_new_record)
  end

  it "renders new referee_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", referee_categories_path, "post" do
      assert_select "input#referee_category_name[name=?]", "referee_category[name]"
      assert_select "input#referee_category_order[name=?]", "referee_category[order]"
      assert_select "input#referee_category_active[name=?]", "referee_category[active]"
    end
  end
end
