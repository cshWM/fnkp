require "spec_helper"

describe AssociationFeeIssuesController do
  describe "routing" do

    it "routes to #index" do
      get("/association_fee_issues").should route_to("association_fee_issues#index")
    end

    it "routes to #new" do
      get("/association_fee_issues/new").should route_to("association_fee_issues#new")
    end

    it "routes to #show" do
      get("/association_fee_issues/1").should route_to("association_fee_issues#show", :id => "1")
    end

    it "routes to #edit" do
      get("/association_fee_issues/1/edit").should route_to("association_fee_issues#edit", :id => "1")
    end

    it "routes to #create" do
      post("/association_fee_issues").should route_to("association_fee_issues#create")
    end

    it "routes to #update" do
      put("/association_fee_issues/1").should route_to("association_fee_issues#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/association_fee_issues/1").should route_to("association_fee_issues#destroy", :id => "1")
    end

  end
end
