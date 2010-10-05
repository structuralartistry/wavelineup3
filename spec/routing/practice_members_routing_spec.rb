require "spec_helper"

describe PracticeMembersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/practice_members" }.should route_to(:controller => "practice_members", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/practice_members/new" }.should route_to(:controller => "practice_members", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/practice_members/1" }.should route_to(:controller => "practice_members", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/practice_members/1/edit" }.should route_to(:controller => "practice_members", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/practice_members" }.should route_to(:controller => "practice_members", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/practice_members/1" }.should route_to(:controller => "practice_members", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/practice_members/1" }.should route_to(:controller => "practice_members", :action => "destroy", :id => "1")
    end

  end
end
