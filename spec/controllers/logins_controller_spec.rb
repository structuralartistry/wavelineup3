require 'spec_helper'

describe LoginsController do
  render_views

  describe "GET new" do
    it "loads the login page if user not logged in" do
      get :new
      response.should render_template(:new)
    end

    it "loads the home page if user logged in" do
      login_user('practice_admin_user')
      get :new
      response.should redirect_to(home_path)
    end
  end

  describe "POST create" do
    it "should accept an authorized and activated user" do
      user = Factory(:practice_admin_user)
      post :create, { :email => user.email, :password => STANDARD_TEST_PASSWORD}
      flash[:notice].should == "Welcome to WaveLineup #{user.email}!"
      response.should redirect_to(home_path)
      session[:current_user].id.should == user.id
    end

    it "should give message to non-activated user" do
      user = Factory(:practice_admin_user, :active => false, :perishable_token => '123456')
      post :create, { :email => user.email, :password => STANDARD_TEST_PASSWORD}
      flash[:notice].should == "Authentication failed"
      response.should render_template(:new)
      session[:current_user].should eq(nil)
    end

    it "should fail a bad login" do
      user = Factory(:practice_admin_user)
      post :create, { :email => user.email, :password => BAD_STANDARD_TEST_PASSWORD}
      flash[:notice].should == "Authentication failed"
      response.should render_template(:new)
      session[:current_user].should eq(nil)
    end

    it "should log a successful authentication" do
      user = Factory(:practice_admin_user)
      post :create, { :email => user.email, :password => user.password }
      flash[:notice].should == "Welcome to WaveLineup #{user.email}!"
      login = Login.first
      login.email.should == user.email
      login.user_id.should == user.id
      login.success.should == true
    end

    it "should log a failed authentication" do
      bad_email = 'bad@google.com'
      post :create, { :email => bad_email, :password => 'xxxxxx' }
      flash[:notice].should == 'Authentication failed'
      login = Login.first
      login.email.should == bad_email
      login.user_id.should == nil
      login.success.should == false
    end
  end

  describe "DELETE destroy" do
    it "should kill the session" do
      user = login_user('practice_admin_user')
      session[:current_user].id.should eq(user.id)
      delete :destroy
      flash[:notice].should == 'Successfully logged out'
      response.should redirect_to(login_path)
      session[:current_user].should eq(nil)
    end
  end

end
