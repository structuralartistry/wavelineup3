#require 'spec_helper'
#
#describe PasswordResetsController do
#
#  before(:each) do
#    Practice.delete_all
#  end
#  
#  describe "GET new" do
#    it "loads for everyone" do
#      get :new
#      response.should be_success
#    end
#  end
#  
#  describe "POST create" do
#    it "sends me the password reset instructions (good user email)" do
#      user = Factory.create(:practice_admin_user)
#      post :create, :user => { :email => user.email }
#      flash[:notice].should match "Instructions to reset your password have been emailed to you. Please check your email."
#      response.should redirect_to(login_path)
#    end
#    
#    it "tells me user does not exist (bad user email)" do
#      post :create, :user => { :email => "bad_email@gmail.com" }
#      flash[:notice].should match "No user was found with that email address"
#      response.should be_success # reloads the 'new' password reset page
#    end
#    
#  end
#  
#  describe "GET edit" do
#    it "loads the password reset page (good user token)" do 
#      user = Factory.create(:practice_admin_user)
#      get :edit, :id => user.perishable_token
#      response.should be_success
#    end
#    
#    it "returns me to the login page (bad user token)" do
#      get :edit, :id => "99999"
#      response.should redirect_to(login_path)      
#    end
#    
#  end
#  
#  describe "PUT update" do
#    it "successfully updates the users password (good user and good token)" do
#      user = Factory.create(:practice_admin_user)
#      put :update, { :id => user.perishable_token, :user => { :password => "newpassword1", :password_confirmation => "newpassword1" } }
#      flash[:notice].should match "Password successfully updated"  
#      response.should redirect_to(home_path)
#    end
#    
#    it "gives validation error if the new password is faulty" do
#      user = Factory.create(:practice_admin_user)
#      put :update, { :id => user.perishable_token, :user => { :password => "newpassword1", :password_confirmation => "password1" } }
#      response.should be_success  # stays on page presenting the errors
#    end
#  end
#
#end