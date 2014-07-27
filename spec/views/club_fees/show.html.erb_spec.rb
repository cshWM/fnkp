require 'spec_helper'

describe "club_fees/show" do
  before(:each) do
    @club_fee = assign(:club_fee, stub_model(ClubFee,
      :name => "Name",
      :valid_year => 1,
      :value => "9.99",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/9.99/)
    rendered.should match(/false/)
  end
end
