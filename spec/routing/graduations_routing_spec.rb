require "spec_helper"

describe GraduationsController do
  describe "routing" do

    it "routes to #index" do
      get("/graduations").should route_to("graduations#index")
    end

    it "routes to #new" do
      get("/graduations/new").should route_to("graduations#new")
    end

    it "routes to #show" do
      get("/graduations/1").should route_to("graduations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/graduations/1/edit").should route_to("graduations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/graduations").should route_to("graduations#create")
    end

    it "routes to #update" do
      put("/graduations/1").should route_to("graduations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/graduations/1").should route_to("graduations#destroy", :id => "1")
    end

  end
end
