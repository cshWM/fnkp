require 'spec_helper'

describe "referees/index" do
  before(:each) do
    assign(:referees, [
      stub_model(Referee,
        :fnkp_code => "Fnkp Code",
        :official_name => "Official Name",
        :import_code => "Import Code",
        :cc_code => "Cc Code",
        :email => "Email",
        :mobile => "Mobile",
        :other_contact1 => "Other Contact1",
        :other_contact2 => "Other Contact2",
        :address => "Address",
        :postal_code4 => "Postal Code4",
        :postal_code3 => "Postal Code3",
        :municipality => nil,
        :notes => "Notes",
        :altered_by => 1,
        :active => false
      ),
      stub_model(Referee,
        :fnkp_code => "Fnkp Code",
        :official_name => "Official Name",
        :import_code => "Import Code",
        :cc_code => "Cc Code",
        :email => "Email",
        :mobile => "Mobile",
        :other_contact1 => "Other Contact1",
        :other_contact2 => "Other Contact2",
        :address => "Address",
        :postal_code4 => "Postal Code4",
        :postal_code3 => "Postal Code3",
        :municipality => nil,
        :notes => "Notes",
        :altered_by => 1,
        :active => false
      )
    ])
  end

  it "renders a list of referees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fnkp Code".to_s, :count => 2
    assert_select "tr>td", :text => "Official Name".to_s, :count => 2
    assert_select "tr>td", :text => "Import Code".to_s, :count => 2
    assert_select "tr>td", :text => "Cc Code".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Other Contact1".to_s, :count => 2
    assert_select "tr>td", :text => "Other Contact2".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code4".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code3".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
