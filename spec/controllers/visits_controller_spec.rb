require 'spec_helper'

describe VisitsController do

  describe "PUT update" do

    it "should assign a visit in the current user's practice" do
      user = login_user('practice_admin_user')
      practice_member = Factory(:practice_member, :practice => user.practice)
      visit = Factory(:visit, :practice_member_id => practice_member.id)
      put :update, { :id => visit.id, :visit => {} }
      assigns(:visit).should == visit
    end

    it "should not assign a visit not in the current user's practice" do
      user = login_user('practice_admin_user')

      other_practice = Factory(:practice, :name => 'Other Practice')
      practice_member = Factory(:practice_member, :practice_id => other_practice.id)
      visit = Factory(:visit, :practice_member_id => practice_member.id)

      put :update, { :id => visit.id, :visit => {} }
      assigns(:visit).should == nil
    end

  end

  describe "DELETE destroy" do

    it "should delete a visit in the current user's practice" do
      user = login_user('practice_admin_user')
      practice_member = Factory(:practice_member, :practice_id => user.practice.id)
      visit = Factory(:visit, :practice_member_id => practice_member.id)
      delete :destroy, { :id => visit.id, :visit => {} }
      Visit.find_by_id(visit.id).should == nil
      flash[:notice].should == 'Visit successfully deleted'
    end

    it "should not delete a visit in another user's practice" do
      login_user('practice_admin_user')

      other_practice = Factory(:practice, :name => 'Other Practice')
      practice_member = Factory(:practice_member, :practice_id => other_practice.id)
      visit = Factory(:visit, :practice_member_id => practice_member.id)

      delete :destroy, { :id => visit.id, :visit => {} }
      Visit.find_by_id(visit.id).should == visit
      flash[:notice].should == 'Visit was not deleted'
    end

  end

end

