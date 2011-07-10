require 'spec_helper'

describe PracticesController do

  describe "GET edit" do

    it "should assign the current user's practice" do
      user = login_user('practice_admin_user')
      get :edit, :id => user.practice.id
      assigns(:practice).should == user.practice
    end

    it "should not assign a practice that is not the current users" do
      login_user('practice_admin_user')

      other_practice = Factory(:practice, :name => 'Other Practice')
      practice_member = Factory(:practice_member, :practice_id => other_practice.id)

      get :edit, :id => other_practice.id
      assigns(:practice).should == nil
      response.should redirect_to(home_path)
    end

    it "should assign any practice if the user is sysadmin" do
      user = login_user('sysadmin_user')

      practice = Factory(:practice_one)

      get :edit, :id => practice.id
      assigns(:practice).should == practice
    end

  end

  describe "PUT update" do

    it "should assign the current user's practice" do
      user = login_user('practice_admin_user')
      put :update, :id => user.practice.id
      assigns(:practice).should == user.practice
    end

    it "should not assign a practice that is not the current users" do
      user = login_user('practice_admin_user')

      other_practice = Factory(:practice, :name => 'Other Practice')
      practice_member = Factory(:practice_member, :practice_id => other_practice.id)

      put :update, :id => other_practice.id
      assigns(:practice).should == nil
      response.should redirect_to(home_path)
    end

    it "should assign any practice if the user is sysadmin" do
      user = login_user('sysadmin_user')

      practice = Factory(:practice_one)

      put :update, :id => practice.id
      assigns(:practice).should == practice
    end

  end

end

