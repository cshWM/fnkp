require "spec_helper"

describe CoachCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/coach_categories").should route_to("coach_categories#index")
    end

    it "routes to #new" do
      get("/coach_categories/new").should route_to("coach_categories#new")
    end

    it "routes to #show" do
      get("/coach_categories/1").should route_to("coach_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coach_categories/1/edit").should route_to("coach_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coach_categories").should route_to("coach_categories#create")
    end

    it "routes to #update" do
      put("/coach_categories/1").should route_to("coach_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coach_categories/1").should route_to("coach_categories#destroy", :id => "1")
    end

  end
end
