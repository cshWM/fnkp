require 'spec_helper'

describe "municipalities/new" do
  before(:each) do
    assign(:municipality, stub_model(Municipality,
      :name => "MyString",
      :district => nil,
      :active => false
    ).as_new_record)
  end

  it "renders new municipality form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", municipalities_path, "post" do
      assert_select "input#municipality_name[name=?]", "municipality[name]"
      assert_select "input#municipality_district[name=?]", "municipality[district]"
      assert_select "input#municipality_active[name=?]", "municipality[active]"
    end
  end
end
