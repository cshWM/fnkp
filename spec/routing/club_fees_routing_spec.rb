require "spec_helper"

describe ClubFeesController do
  describe "routing" do

    it "routes to #index" do
      get("/club_fees").should route_to("club_fees#index")
    end

    it "routes to #new" do
      get("/club_fees/new").should route_to("club_fees#new")
    end

    it "routes to #show" do
      get("/club_fees/1").should route_to("club_fees#show", :id => "1")
    end

    it "routes to #edit" do
      get("/club_fees/1/edit").should route_to("club_fees#edit", :id => "1")
    end

    it "routes to #create" do
      post("/club_fees").should route_to("club_fees#create")
    end

    it "routes to #update" do
      put("/club_fees/1").should route_to("club_fees#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/club_fees/1").should route_to("club_fees#destroy", :id => "1")
    end

  end
end
