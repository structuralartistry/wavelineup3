require 'spec_helper'

describe UserSessionsController do

  describe "POST create" do

    it "should log a successful authentication" do
      user = Factory(:practice_admin_user)
      post :create, { :user_session => { :email => user.email, :password => user.password } }
      flash[:notice].should == "Welcome to WaveLineup #{user.email}!"
      login = Login.first
      login.email.should == user.email
      login.user_id.should == user.id
      login.success.should == true
    end

    it "should log a failed authentication" do
      bad_email = 'bad@google.com'
      post :create, { :user_session => { :email => bad_email, :password => 'xxxxxx' } }
      flash[:notice].should == 'Authentication failed'
      login = Login.first
      login.email.should == bad_email
      login.user_id.should == nil
      login.success.should == false
    end

  end
end
