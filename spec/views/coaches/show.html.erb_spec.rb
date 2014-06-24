require 'spec_helper'

describe "coaches/show" do
  before(:each) do
    @coach = assign(:coach, stub_model(Coach,
      :fnkp_code => "Fnkp Code",
      :ipdj_code => "Ipdj Code",
      :official_name => "Official Name",
      :import_code => "Import Code",
      :cc_code => "Cc Code",
      :valid => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fnkp Code/)
    rendered.should match(/Ipdj Code/)
    rendered.should match(/Official Name/)
    rendered.should match(/Import Code/)
    rendered.should match(/Cc Code/)
    rendered.should match(/false/)
  end
end
