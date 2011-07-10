require 'spec_helper'

describe PracticeMembersController do

  describe "GET edit" do

    it "should assign a practice member in the current user's practice" do
      user = login_user('practice_admin_user')
      practice_member = Factory(:practice_member, :practice => user.practice)
      get :edit, :id => practice_member.id
      assigns(:practice_member).should == practice_member
    end

    it "should not assign a practice member not in the current user's practice" do
      user = login_user('practice_admin_user')

      other_practice = Factory(:practice, :name => 'Other Practice')
      practice_member = Factory(:practice_member, :practice_id => other_practice.id)

      get :edit, :id => practice_member.id
      assigns(:practice_member).should == nil
    end

  end

  describe "POST create" do

    it "should assign the current user's practice to the created user" do
      user = login_user('practice_admin_user')
      post :create, { :practice_member => { :last_name => 'Smart', :first_name => 'Joe' } }
      flash[:notice].should == 'Practice Member successfully created'
      PracticeMember.find_by_last_name('Smart').practice_id.should == user.practice.id
    end

  end

  describe "PUT update" do

    it "should assign a practice member in the current user's practice" do
      user = login_user('practice_admin_user')
      practice_member = Factory(:practice_member, :practice => user.practice)
      put :update, :id => practice_member.id
      flash[:notice].should == 'Practice Member successfully updated'
      assigns(:practice_member).should == practice_member
    end

    it "should not assign a practice member not in the current user's practice" do
      user = login_user('practice_admin_user')

      other_practice = Factory(:practice, :name => 'Other Practice')
      practice_member = Factory(:practice_member, :practice_id => other_practice.id)

      put :update, :id => practice_member.id
      flash[:notice].should_not == 'Practice Member successfully updated'
      assigns(:practice_member).should == nil
    end


  end

  describe "DELETE destroy" do

    it "should delete a practice member in the current user's practice" do
      user = login_user('practice_admin_user')
      practice_member = Factory(:practice_member, :practice_id => user.practice.id)
      delete :destroy, :id => practice_member.id
      PracticeMember.find_by_id(practice_member.id).should == nil
      flash[:notice].should == 'Practice Member successfully deleted'
    end

    it "should not delete a practice member in another user's practice" do
      login_user('practice_admin_user')

      other_practice = Factory(:practice, :name => 'Other Practice')
      practice_member = Factory(:practice_member, :practice_id => other_practice.id)

      delete :destroy, :id => practice_member.id
      PracticeMember.find_by_id(practice_member.id).id.should == practice_member.id
      flash[:notice].should_not == 'Practice Member successfully deleted'
    end

  end


end

