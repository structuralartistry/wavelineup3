require "spec_helper"

describe FeatureRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/feature_requests").should route_to("feature_requests#index")
    end

    it "routes to #new" do
      get("/feature_requests/new").should route_to("feature_requests#new")
    end

    it "routes to #show" do
      get("/feature_requests/1").should route_to("feature_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/feature_requests/1/edit").should route_to("feature_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/feature_requests").should route_to("feature_requests#create")
    end

    it "routes to #update" do
      put("/feature_requests/1").should route_to("feature_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/feature_requests/1").should route_to("feature_requests#destroy", :id => "1")
    end

  end
end
