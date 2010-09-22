# require 'spec_helper'
# 
# describe UserSessionsController do
#   render_views
# 
#   describe 'GET new (login)' do
#     it 'shows the login form' do
#       get :new
#       response.should have_selector('input', :id => 'user_session_login')
#       response.should have_selector('input', :id => 'user_session_password', :type => 'password')
#       response.should have_selector('input', :type => 'submit', :value => 'Login')
#     end
#   end
#   
#   describe 'POST create and DELETE destroy' do
#     it 'successfully logs the user in' do
#       user = Factory.create(:user)
#       post :create, { :user_session => { :login => user.login, :password => user.password } }
#       response.should redirect_to(root_url)
#       flash[:notice].should == 'Successfully logged in'
#     end
#     
#     it 'successfully logs the user out' do
#       user = Factory.create(:user)
#       post :create, { :user_session => { :login => user.login, :password => user.password } }
#       response.should redirect_to(root_url)
#       flash[:notice].should == 'Successfully logged in'
#       
#       
#       pending('get the destroy action working with the session and not the id')
#       delete :destroy, :id => 0
#       assert_equal flash[:notice], 'Successfully logged out'
#     end
#   end
# 
# end
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# # 
# # def test_login_form_loads
# #   get :new
# #   assert :success
# #   assert_tag :tag => 'input', :attributes => { :id => 'user_session_login'}
# #   assert_tag :tag => 'input', :attributes => { :id => 'user_session_password', :type => 'password' }
# #   assert_tag :tag => 'input', :attributes => { :value => 'Login' }
# # end
# # 
# # def test_login_and_logout_successful
# #   user = Factory.create(:user)
# #   post :create, { :user_session => { :login => user.login, :password => user.password } }
# #   assert :success
# #   assert_equal flash[:notice], 'Successfully logged in'
# #   
# #   
# #   
# #   delete :destroy, :id => 0
# #   assert_equal flash[:notice], 'Successfully logged out'
# # end
# # 
# # def test_login_failed
# #   
# # end
