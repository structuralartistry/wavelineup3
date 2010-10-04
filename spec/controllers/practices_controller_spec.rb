require 'spec_helper'

describe PracticesController do

  before(:all) do
    Factory.create(:sysadmin_role)
    Factory.create(:practice_admin_role)
    Factory.create(:practice_user_role)
  end

  before(:each) do
    Practice.delete_all
  end
  
  describe "GET index" do
    it "does not load for guest role" do
      get :index
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(login_path)
    end
    
    it "loads for logged sysadmin role" do
      login_user(:sysadmin)
      get :index
      flash[:notice].should be_nil
      response.should be_success
    end
    
    it "does not load for practice admin role" do
      login_user(:practice_admin)
      get :index
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(home_path)
    end
    
    it "does not load for practice user role" do
      login_user(:practice_user)
      get :index
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(home_path)
    end
  end
  
  describe "GET new" do
    it "loads for guest role (anyone)" do
      get :new
      response.should be_success
    end
  end
  
  describe "GET edit" do    
    it "sends unauthorized and unauthenticated user to the login page" do
      practice = Factory.create(:practice_one)
      get :edit, :id => practice.id
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(login_path)
    end
    
    it "loads any practice for sysadmin" do 
      login_user(:sysadmin)
      practice_one = Factory.create(:practice_one)
      practice_two = Factory.create(:practice_two)
      get :edit, :id => practice_one.id
      response.should be_success
      get :edit, :id => practice_two.id
      response.should be_success
    end
    
    it "loads current users practice only for practice admin" do 
      user = login_user(:practice_admin)
      
      practice_one = Practice.find(user.practice_id)
      
      practice_two = Factory.create(:practice_two)
      
      get :edit, :id => practice_one.id
      response.should be_success
      get :edit, :id => practice_two.id
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(home_path)
    end
    
    it "loads current users practice only for practice user" do 
      user = login_user(:practice_user)
      
      practice_one = Practice.find(user.practice_id)
      
      practice_two = Factory.create(:practice_two)
      
      get :edit, :id => practice_one.id
      response.should be_success
      get :edit, :id => practice_two.id
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(home_path)
    end
  end
  
  describe "POST create" do
    it "creates for guest role (anyone)" do
      post :create, :practice => { :name => "any name", :users_attributes => { :"0" => { :email => "anyone@gmail.com", :password => "", :password_confirmation => "" } } }
      response.should be_success
    end
  end
  
  describe "PUT update" do
    it "sends unauthorized and unauthenticated user to the login page" do
      practice = Factory.create(:practice_one)
      put :update, { :id => practice.id, :practice => { :name => "hackers practice" } }
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(login_path)
    end
    
    it "updates any practice if role is sysadmin" do
      login_user(:sysadmin)
    
      practice = Factory.create(:practice_one)
      put :update, { :id => practice.id, :practice => { :name => "Changed Practice One Name" } }
      flash[:notice].should match "Practice was successfully updated"
      response.should redirect_to(home_path)
      
      practice = Factory.create(:practice_two)
      put :update, { :id => practice.id, :practice => { :name => "Change Practice Two Name" } }
      flash[:notice].should match "Practice was successfully updated"
      response.should redirect_to(home_path)
    end
    
    it "updates only the current user's practice if role is practice admin" do
      practice = login_user(:practice_admin).practice
      
      # this is the logged in user's practice - should update
      put :update, { :id => practice.id, :practice => { :name => "Changed Practice One Name" } }
      flash[:notice].should match "Practice was successfully updated"
      response.should redirect_to(home_path)
        
      # someone elses practice - should not update
      practice = Factory.create(:practice_two)
      put :update, { :id => practice.id, :practice => { :name => "Change Practice Two Name" } }
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
    end
    
    it "updates only the current user's practice if role is practice user" do
      practice = login_user(:practice_user).practice
      
      # this is the logged in user's practice - should update
      put :update, { :id => practice.id, :practice => { :name => "Changed Practice One Name" } }
      flash[:notice].should match "Practice was successfully updated"
      response.should redirect_to(home_path)
        
      # someone elses practice - should not update
      practice = Factory.create(:practice_two)
      put :update, { :id => practice.id, :practice => { :name => "Change Practice Two Name" } }
      flash[:notice].should match RESTRICTED_PAGE_NOTICE      
    end
  end
    
  describe "DELETE destroy" do
    it "does not allow the guest role to delete practices" do
      practice = Factory.create(:practice_one)
      delete :destroy, :id => practice.id
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(login_path)
    end
    
    it "allows the sysadmin role to delete practices" do
      login_user(:sysadmin)
      
      practice = Factory.create(:practice_one)
      delete :destroy, :id => practice.id
      flash[:notice].should match "Practice successfully deleted"
      response.should redirect_to(practices_path)
      
      practice = Factory.create(:practice_two)
      delete :destroy, :id => practice.id
      flash[:notice].should match "Practice successfully deleted"
      response.should redirect_to(practices_path)
    end
    
    it "does not allow practice admin role to delete practices" do
      practice = login_user(:practice_admin).practice
      
      # cant delete own practice
      delete :destroy, :id => practice.id
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(home_path)
      
      # cant delete another's practice
      practice = Factory.create(:practice_two)
      delete :destroy, :id => practice.id
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(home_path)
    end
    
    it "does not allow practice user role to delete practices" do
      practice = login_user(:practice_user).practice
      
      # cant delete own practice
      delete :destroy, :id => practice.id
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(home_path)
      
      # cant delete another's practice
      practice = Factory.create(:practice_two)
      delete :destroy, :id => practice.id
      flash[:notice].should match RESTRICTED_PAGE_NOTICE
      response.should redirect_to(home_path)
    end
  end
end


