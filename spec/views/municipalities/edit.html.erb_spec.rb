require 'spec_helper'

describe "municipalities/edit" do
  before(:each) do
    @municipality = assign(:municipality, stub_model(Municipality,
      :name => "MyString",
      :district => nil,
      :active => false
    ))
  end

  it "renders the edit municipality form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", municipality_path(@municipality), "post" do
      assert_select "input#municipality_name[name=?]", "municipality[name]"
      assert_select "input#municipality_district[name=?]", "municipality[district]"
      assert_select "input#municipality_active[name=?]", "municipality[active]"
    end
  end
end
