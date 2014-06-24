require 'spec_helper'

describe "coach_categories/show" do
  before(:each) do
    @coach_category = assign(:coach_category, stub_model(CoachCategory,
      :name => "Name",
      :order => 1,
      :valid => false
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
