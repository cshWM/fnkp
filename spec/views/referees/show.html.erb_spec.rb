require 'spec_helper'

describe "referees/show" do
  before(:each) do
    @referee = assign(:referee, stub_model(Referee,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fnkp Code/)
    rendered.should match(/Official Name/)
    rendered.should match(/Import Code/)
    rendered.should match(/Cc Code/)
    rendered.should match(/Email/)
    rendered.should match(/Mobile/)
    rendered.should match(/Other Contact1/)
    rendered.should match(/Other Contact2/)
    rendered.should match(/Address/)
    rendered.should match(/Postal Code4/)
    rendered.should match(/Postal Code3/)
    rendered.should match(//)
    rendered.should match(/Notes/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
