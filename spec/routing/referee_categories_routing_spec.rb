require "spec_helper"

describe RefereeCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/referee_categories").should route_to("referee_categories#index")
    end

    it "routes to #new" do
      get("/referee_categories/new").should route_to("referee_categories#new")
    end

    it "routes to #show" do
      get("/referee_categories/1").should route_to("referee_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/referee_categories/1/edit").should route_to("referee_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/referee_categories").should route_to("referee_categories#create")
    end

    it "routes to #update" do
      put("/referee_categories/1").should route_to("referee_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/referee_categories/1").should route_to("referee_categories#destroy", :id => "1")
    end

  end
end
