# require 'spec_helper'
# 
# describe ActivationsController do
# 
#   describe "POST create" do
#     it "sends me to the login form if I am not logged in" do
#       user = login_user(:practice_admin)
#       post :create, :activation_code => ''
#       response.should redirect_to(login_url)
#     end
#     
#     it "loads if I am logged in" do
#       login_user(:practice_admin)
#       get :index
#       response.should be_success
#     end
#   end
# 
# end
