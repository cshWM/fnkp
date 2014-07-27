require 'spec_helper'

describe "club_fees/edit" do
  before(:each) do
    @club_fee = assign(:club_fee, stub_model(ClubFee,
      :name => "MyString",
      :valid_year => 1,
      :value => "9.99",
      :active => false
    ))
  end

  it "renders the edit club_fee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", club_fee_path(@club_fee), "post" do
      assert_select "input#club_fee_name[name=?]", "club_fee[name]"
      assert_select "input#club_fee_valid_year[name=?]", "club_fee[valid_year]"
      assert_select "input#club_fee_value[name=?]", "club_fee[value]"
      assert_select "input#club_fee_active[name=?]", "club_fee[active]"
    end
  end
end
