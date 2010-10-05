#require 'spec_helper'
#
#describe HomeController do
#
#  describe "GET index" do
#    it "sends me to the login form if I am not logged in" do
#      get :index
#      response.should redirect_to(login_path)
#    end
#    
#    it "loads if I am logged in" do
#      login_user(:practice_admin_user)
#      get :index
#      response.should be_success
#    end
#  end
#
#end
