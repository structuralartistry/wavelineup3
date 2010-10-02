# require 'spec_helper'
# 
# describe UsersController do
#   render_views

#   describe "register new user" do
#     
#     it "sends the user welcome email when a new user signs up" do
#       user = Factory.build(:practice_user)
#       post :create, { :user => {:email => user.email, :password => user.password, :password_confirmation => user.password_confirmation} }
#       ActionMailer::Base.deliveries.size.should == 1
#     end
#     
#   end
# 
# end
#   
  #   it 'shows the user registration form' do
  #     get :new
  #     response.should have_selector('input', :id => 'user_login')
  #     response.should have_selector('input', :id => 'user_email')
  #     response.should have_selector('input', :id => 'user_password', :type => 'password')
  #     response.should have_selector('input', :id => 'user_password_confirmation', :type => 'password')
  #     response.should have_selector('input', :type => 'submit', :value => 'Submit')
  #   end
  #   
  #   it 'creates a new user when the form is correctly filled out' do
  #     user = Factory.build(:user)
  #     post :create, { :user => { 
  #                                 :login => user.login, 
  #                                 :email => user.email, 
  #                                 :password => user.password, 
  #                                 :password_confirmation => user.password }
  #                   }
  #     response.should redirect_to(root_path)
  #     flash[:notice].should == 'Registration successful'
  #   end
  # end

