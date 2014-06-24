require 'spec_helper'

describe "referee_categories/show" do
  before(:each) do
    @referee_category = assign(:referee_category, stub_model(RefereeCategory,
      :name => "Name",
      :order => 1,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
