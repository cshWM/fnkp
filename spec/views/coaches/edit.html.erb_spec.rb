require 'spec_helper'

describe "coaches/edit" do
  before(:each) do
    @coach = assign(:coach, stub_model(Coach,
      :fnkp_code => "MyString",
      :ipdj_code => "MyString",
      :official_name => "MyString",
      :import_code => "MyString",
      :cc_code => "MyString",
      :valid => false
    ))
  end

  it "renders the edit coach form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", coach_path(@coach), "post" do
      assert_select "input#coach_fnkp_code[name=?]", "coach[fnkp_code]"
      assert_select "input#coach_ipdj_code[name=?]", "coach[ipdj_code]"
      assert_select "input#coach_official_name[name=?]", "coach[official_name]"
      assert_select "input#coach_import_code[name=?]", "coach[import_code]"
      assert_select "input#coach_cc_code[name=?]", "coach[cc_code]"
      assert_select "input#coach_valid[name=?]", "coach[valid]"
    end
  end
end
