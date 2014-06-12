require 'spec_helper'

describe "association_fees/new" do
  before(:each) do
    assign(:association_fee, stub_model(AssociationFee,
      :name => "MyString",
      :valid_year => 1,
      :is_total => false,
      :value => "9.99",
      :valid => false,
      :has_many => ""
    ).as_new_record)
  end

  it "renders new association_fee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", association_fees_path, "post" do
      assert_select "input#association_fee_name[name=?]", "association_fee[name]"
      assert_select "input#association_fee_valid_year[name=?]", "association_fee[valid_year]"
      assert_select "input#association_fee_is_total[name=?]", "association_fee[is_total]"
      assert_select "input#association_fee_value[name=?]", "association_fee[value]"
      assert_select "input#association_fee_valid[name=?]", "association_fee[valid]"
      assert_select "input#association_fee_has_many[name=?]", "association_fee[has_many]"
    end
  end
end
