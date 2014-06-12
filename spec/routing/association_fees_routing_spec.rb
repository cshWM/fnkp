require "spec_helper"

describe AssociationFeesController do
  describe "routing" do

    it "routes to #index" do
      get("/association_fees").should route_to("association_fees#index")
    end

    it "routes to #new" do
      get("/association_fees/new").should route_to("association_fees#new")
    end

    it "routes to #show" do
      get("/association_fees/1").should route_to("association_fees#show", :id => "1")
    end

    it "routes to #edit" do
      get("/association_fees/1/edit").should route_to("association_fees#edit", :id => "1")
    end

    it "routes to #create" do
      post("/association_fees").should route_to("association_fees#create")
    end

    it "routes to #update" do
      put("/association_fees/1").should route_to("association_fees#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/association_fees/1").should route_to("association_fees#destroy", :id => "1")
    end

  end
end
