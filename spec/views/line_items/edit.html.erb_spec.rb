require 'spec_helper'

describe "line_items/edit" do
  before(:each) do
    @line_item = assign(:line_item, stub_model(LineItem,
      :name => "MyString",
      :value => "9.99",
      :state => "MyString",
      :order => nil
    ))
  end

  it "renders the edit line_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", line_item_path(@line_item), "post" do
      assert_select "input#line_item_name[name=?]", "line_item[name]"
      assert_select "input#line_item_value[name=?]", "line_item[value]"
      assert_select "input#line_item_state[name=?]", "line_item[state]"
      assert_select "input#line_item_order[name=?]", "line_item[order]"
    end
  end
end
