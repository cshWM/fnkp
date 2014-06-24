require 'spec_helper'

describe "coaches/index" do
  before(:each) do
    assign(:coaches, [
      stub_model(Coach,
        :fnkp_code => "Fnkp Code",
        :ipdj_code => "Ipdj Code",
        :official_name => "Official Name",
        :import_code => "Import Code",
        :cc_code => "Cc Code",
        :valid => false
      ),
      stub_model(Coach,
        :fnkp_code => "Fnkp Code",
        :ipdj_code => "Ipdj Code",
        :official_name => "Official Name",
        :import_code => "Import Code",
        :cc_code => "Cc Code",
        :valid => false
      )
    ])
  end

  it "renders a list of coaches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fnkp Code".to_s, :count => 2
    assert_select "tr>td", :text => "Ipdj Code".to_s, :count => 2
    assert_select "tr>td", :text => "Official Name".to_s, :count => 2
    assert_select "tr>td", :text => "Import Code".to_s, :count => 2
    assert_select "tr>td", :text => "Cc Code".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
