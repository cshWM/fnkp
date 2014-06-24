require 'spec_helper'

describe "graduations/show" do
  before(:each) do
    @graduation = assign(:graduation, stub_model(Graduation,
      :name => "Name",
      :order => 1,
      :price => 2,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
