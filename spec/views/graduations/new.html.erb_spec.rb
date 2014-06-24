require 'spec_helper'

describe "graduations/new" do
  before(:each) do
    assign(:graduation, stub_model(Graduation,
      :name => "MyString",
      :order => 1,
      :price => 1,
      :active => false
    ).as_new_record)
  end

  it "renders new graduation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", graduations_path, "post" do
      assert_select "input#graduation_name[name=?]", "graduation[name]"
      assert_select "input#graduation_order[name=?]", "graduation[order]"
      assert_select "input#graduation_price[name=?]", "graduation[price]"
      assert_select "input#graduation_active[name=?]", "graduation[active]"
    end
  end
end
