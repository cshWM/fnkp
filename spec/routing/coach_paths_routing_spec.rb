require "spec_helper"

describe CoachPathsController do
  describe "routing" do

    it "routes to #index" do
      get("/coach_paths").should route_to("coach_paths#index")
    end

    it "routes to #new" do
      get("/coach_paths/new").should route_to("coach_paths#new")
    end

    it "routes to #show" do
      get("/coach_paths/1").should route_to("coach_paths#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coach_paths/1/edit").should route_to("coach_paths#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coach_paths").should route_to("coach_paths#create")
    end

    it "routes to #update" do
      put("/coach_paths/1").should route_to("coach_paths#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coach_paths/1").should route_to("coach_paths#destroy", :id => "1")
    end

  end
end
