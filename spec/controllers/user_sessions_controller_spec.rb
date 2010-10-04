require 'spec_helper'

describe UserSessionsController do

  before(:all) do
    Factory.create(:sysadmin_role)
    Factory.create(:practice_admin_role)
    Factory.create(:practice_user_role)
  end
  
  before(:each) do
    Practice.delete_all
  end
  
  describe "GET new" do
    it "loads for guest" do
      get :new
      response.should be_success
    end
    
    it "sends a logged in user to their home page if they are already logged in" do
      login_user(:practice_admin_user)
      
      get :new
      response.should redirect_to(home_path)
    end
  end
  
  describe "POST create" do
    it "logs in the user if good credentials" do
      user = login_user(:practice_admin_user)
      
      post :create, :user_session => { :email => user.email, :password => user.password }
      response.should redirect_to(home_path)
    end
    
    it "alerts guest to authentication failure if bad credentials" do
      post :create, :user_session => { :email => "bad@gmail.com", :password => "xoxoxo" }
      flash[:notice].should match "Authentication failed"
      response.should be_success # reloads new session page 
    end
  end
  
  describe "DELETE destroy" do
    it "logs out the current user" do
      user = login_user(:practice_admin_user)
      
      delete :destroy, :id => user.id
      flash[:notice].should match "Successfully logged out"
      response.should redirect_to(login_path)
    end
    
    it "sends guest to the login page if no current user" do
      delete :destroy, :id => 1234
      response.should redirect_to(login_path)
    end
  end
    
end


