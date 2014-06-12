require 'spec_helper'

describe "association_fees/show" do
  before(:each) do
    @association_fee = assign(:association_fee, stub_model(AssociationFee,
      :name => "Name",
      :valid_year => 1,
      :is_total => false,
      :value => "9.99",
      :valid => false,
      :has_many => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/9.99/)
    rendered.should match(/false/)
    rendered.should match(//)
  end
end
