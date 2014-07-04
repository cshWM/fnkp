require "spec_helper"

describe RefereePathsController do
  describe "routing" do

    it "routes to #index" do
      get("/referee_paths").should route_to("referee_paths#index")
    end

    it "routes to #new" do
      get("/referee_paths/new").should route_to("referee_paths#new")
    end

    it "routes to #show" do
      get("/referee_paths/1").should route_to("referee_paths#show", :id => "1")
    end

    it "routes to #edit" do
      get("/referee_paths/1/edit").should route_to("referee_paths#edit", :id => "1")
    end

    it "routes to #create" do
      post("/referee_paths").should route_to("referee_paths#create")
    end

    it "routes to #update" do
      put("/referee_paths/1").should route_to("referee_paths#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/referee_paths/1").should route_to("referee_paths#destroy", :id => "1")
    end

  end
end
