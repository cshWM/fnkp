require 'spec_helper'

describe "referees/new" do
  before(:each) do
    assign(:referee, stub_model(Referee,
      :fnkp_code => "MyString",
      :official_name => "MyString",
      :import_code => "MyString",
      :cc_code => "MyString",
      :email => "MyString",
      :mobile => "MyString",
      :other_contact1 => "MyString",
      :other_contact2 => "MyString",
      :address => "MyString",
      :postal_code4 => "MyString",
      :postal_code3 => "MyString",
      :municipality => nil,
      :notes => "MyString",
      :altered_by => 1,
      :active => false
    ).as_new_record)
  end

  it "renders new referee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", referees_path, "post" do
      assert_select "input#referee_fnkp_code[name=?]", "referee[fnkp_code]"
      assert_select "input#referee_official_name[name=?]", "referee[official_name]"
      assert_select "input#referee_import_code[name=?]", "referee[import_code]"
      assert_select "input#referee_cc_code[name=?]", "referee[cc_code]"
      assert_select "input#referee_email[name=?]", "referee[email]"
      assert_select "input#referee_mobile[name=?]", "referee[mobile]"
      assert_select "input#referee_other_contact1[name=?]", "referee[other_contact1]"
      assert_select "input#referee_other_contact2[name=?]", "referee[other_contact2]"
      assert_select "input#referee_address[name=?]", "referee[address]"
      assert_select "input#referee_postal_code4[name=?]", "referee[postal_code4]"
      assert_select "input#referee_postal_code3[name=?]", "referee[postal_code3]"
      assert_select "input#referee_municipality[name=?]", "referee[municipality]"
      assert_select "input#referee_notes[name=?]", "referee[notes]"
      assert_select "input#referee_altered_by[name=?]", "referee[altered_by]"
      assert_select "input#referee_active[name=?]", "referee[active]"
    end
  end
end
