require 'spec_helper'

describe "municipalities/show" do
  before(:each) do
    @municipality = assign(:municipality, stub_model(Municipality,
      :name => "Name",
      :district => nil,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/false/)
  end
end
