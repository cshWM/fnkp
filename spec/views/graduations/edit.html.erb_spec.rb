require 'spec_helper'

describe "graduations/edit" do
  before(:each) do
    @graduation = assign(:graduation, stub_model(Graduation,
      :name => "MyString",
      :order => 1,
      :price => 1,
      :active => false
    ))
  end

  it "renders the edit graduation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", graduation_path(@graduation), "post" do
      assert_select "input#graduation_name[name=?]", "graduation[name]"
      assert_select "input#graduation_order[name=?]", "graduation[order]"
      assert_select "input#graduation_price[name=?]", "graduation[price]"
      assert_select "input#graduation_active[name=?]", "graduation[active]"
    end
  end
end
