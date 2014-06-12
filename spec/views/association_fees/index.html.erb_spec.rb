require 'spec_helper'

describe "association_fees/index" do
  before(:each) do
    assign(:association_fees, [
      stub_model(AssociationFee,
        :name => "Name",
        :valid_year => 1,
        :is_total => false,
        :value => "9.99",
        :valid => false,
        :has_many => ""
      ),
      stub_model(AssociationFee,
        :name => "Name",
        :valid_year => 1,
        :is_total => false,
        :value => "9.99",
        :valid => false,
        :has_many => ""
      )
    ])
  end

  it "renders a list of association_fees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
