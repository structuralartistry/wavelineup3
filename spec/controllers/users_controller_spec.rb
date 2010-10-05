#require 'spec_helper'
#
#describe UsersController do
#
#  before(:all) do
#    Factory.create(:sysadmin_role)
#    Factory.create(:practice_admin_role)
#    Factory.create(:practice_user_role)
#  end
#  
#  before(:each) do
#    Practice.delete_all
#    
#    practice_one = Factory.create(:practice_one)
#    
#    Factory.create(:practice_admin_user, :practice_id => practice_one.id)
#    Factory.create(:practice_user, :practice_id => practice_one.id)
#  end
#  
#  describe "GET new" do
#    it "does not load for guest role" do
#      get :new
#      flash[:notice].should match RESTRICTED_PAGE_NOTICE
#      response.should redirect_to(login_url)
#    end
#    
#    it "loads for sysadmin role" do
#      login_user(:sysadmin_user)
#      get :new
#      response.should be_success
#    end
#    
#    it "loads for practice admin role" do
#      login_user(:practice_admin_user)
#      get :new
#      response.should be_success      
#    end
#    
#    it "loads for practice user role" do 
#      login_user(:practice_user)
#      get :new
#      response.should be_success      
#    end
#  end
#  
#  describe "GET edit" do
#    it "does not load for guest role" do
#      user_to_edit = User.includes("role").where("roles.name!='sysadmin'").first
#      get :edit
#      flash[:notice].should match RESTRICTED_PAGE_NOTICE
#      response.should redirect_to(login_url)
#    end
#    
#    it "loads for sysadmin role to edit own profile" do
#      login_user(:sysadmin_user)
#      get :edit
#      response.should be_success
#    end
#    
#    it "loads for practice admin role to edit own profile" do
#      login_user(:practice_admin_user)
#      get :edit
#      response.should be_success      
#    end
#    
#    it "loads for practice user role to edit own profile" do 
#      login_user(:practice_user)
#      get :edit
#      response.should be_success      
#    end
#  end
#  
#  describe "POST create" do
#    it "does not load for guest role" do
#      post :create, :user => { :email => "new_user@gmail.com", :password => "password1", :password_confirmation => "password1" }
#      flash[:notice].should match RESTRICTED_PAGE_NOTICE
#      response.should redirect_to(login_url)
#    end
#    
#    it "loads for practice admin role" do
#      login_user(:practice_admin_user)
#      post :create, :user => { :email => "new_user@gmail.com", :password => "password1", :password_confirmation => "password1" }
#      flash[:notice].should match "User was successfully created. Please check email for new_user@gmail.com for the activation link."
#    end
#    
#    it "loads for practice user role" do 
#      login_user(:practice_user)
#      post :create, :user => { :email => "new_user@gmail.com", :password => "password1", :password_confirmation => "password1" }
#      flash[:notice].should match "User was successfully created. Please check email for new_user@gmail.com for the activation link."
#    end    
#  end
#  
#  describe "PUT update" do
#    it "does not save for guest role" do
#      user_to_edit = User.includes("role").where("roles.name!='sysadmin'").first     
#      put :update, :id => user_to_edit.id, :user => { :email => "changed_email@gmail.com" }
#      flash[:notice].should match RESTRICTED_PAGE_NOTICE
#      response.should redirect_to(login_url)
#    end
#    
#    it "saves own profile sysadmin role" do
#      current_user = login_user(:sysadmin_user)
#      put :update, :id => current_user.id, :user => { :email => "changed_email@gmail.com" }
#      flash[:notice].should match 'User profile successfully updated'
#      response.should redirect_to(home_path)
#    end
#    
#    it "saves own profile for practice admin role" do
#      current_user = login_user(:practice_admin_user)
#      put :update, :id => current_user.id, :user => { :email => "changed_email@gmail.com" }
#      flash[:notice].should match 'User profile successfully updated'
#      response.should redirect_to(home_path)
#    end
#    
#    it "saves own profile for practice user role" do
#      current_user = login_user(:practice_user) 
#      put :update, :id => current_user.id, :user => { :email => "changed_email@gmail.com" }
#      flash[:notice].should match 'User profile successfully updated'
#      response.should redirect_to(home_path)
#    end    
#  end
#  
#  describe "DELETE destroy" do
#    it "does not delete for guest role" do
#      user_to_delete = User.includes("role").where("roles.name!='sysadmin'").first
#      delete :destroy, :id => user_to_delete.id
#      flash[:notice].should match RESTRICTED_PAGE_NOTICE
#      response.should redirect_to(login_path)
#    end
#    
#    it "deletes for sysadmin role" do
#      login_user(:sysadmin_user)
#      user_to_delete = User.includes("role").where("roles.name!='sysadmin'").first
#      delete :destroy, :id => user_to_delete.id
#      flash[:notice].should match "User successfully deleted"
#      response.should redirect_to(home_path)
#    end
#    
#    it "deletes for practice admin role" do
#      current_user = login_user(:practice_admin_user)
#      user_to_delete = User.includes("role").where("roles.name!='sysadmin'").first
#      delete :destroy, :id => user_to_delete.id
#      flash[:notice].should match "User successfully deleted"
#      response.should redirect_to(edit_practice_path(current_user.practice_id))
#    end
#    
#    it "deletes for practice user role" do 
#      current_user = login_user(:practice_user)
#      user_to_delete = User.includes("role").where("roles.name!='sysadmin'").first
#      delete :destroy, :id => user_to_delete.id
#      flash[:notice].should match "User successfully deleted"
#      response.should redirect_to(edit_practice_path(current_user.practice_id))
#    end
#  end
#    
#end
#
#
