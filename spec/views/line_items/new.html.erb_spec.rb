require 'spec_helper'

describe "line_items/new" do
  before(:each) do
    assign(:line_item, stub_model(LineItem,
      :name => "MyString",
      :value => "9.99",
      :state => "MyString",
      :order => nil
    ).as_new_record)
  end

  it "renders new line_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", line_items_path, "post" do
      assert_select "input#line_item_name[name=?]", "line_item[name]"
      assert_select "input#line_item_value[name=?]", "line_item[value]"
      assert_select "input#line_item_state[name=?]", "line_item[state]"
      assert_select "input#line_item_order[name=?]", "line_item[order]"
    end
  end
end
