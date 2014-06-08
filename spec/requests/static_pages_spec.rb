require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do

#    it "should exist" do
#      visit '/static_pages/home'
#      response.status.should be(200)
#    end

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

  end


  describe "Help Page" do

#    it "should exist" do
#      visit '/static_pages/home'
#      response.status.should be(200)
#    end

    it "should have the content 'Sample App'" do
      visit '/static_pages/help'
      expect(page).to have_content('Sample App')
    end

  end


  describe "About Page" do

#    it "should exist" do
#      visit '/static_pages/home'
#      response.status.should be(200)
#    end

    it "should have the content 'Sample App'" do
      visit '/static_pages/about'
      expect(page).to have_content('Sample App')
    end

  end


end

