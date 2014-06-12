require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :name => "MyString",
      :total_value => "9.99",
      :state => "MyString",
      :has_many => ""
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "input#order_name[name=?]", "order[name]"
      assert_select "input#order_total_value[name=?]", "order[total_value]"
      assert_select "input#order_state[name=?]", "order[state]"
      assert_select "input#order_has_many[name=?]", "order[has_many]"
    end
  end
end
