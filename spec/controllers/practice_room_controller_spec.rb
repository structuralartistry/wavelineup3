require 'spec_helper'

describe PracticeRoomController do

  describe "GET main" do

    it "should assign a practice member in the current user's practice" do
      user = login_user('practice_admin_user')
      practice_member = Factory(:practice_member, :practice => user.practice)
      get :main, { :id => practice_member.id, :visible_section => 'visit' }
      assigns(:practice_member).should == practice_member
    end

    it "should not assign a practice member not in the current user's practice" do
      user = login_user('practice_admin_user')

      other_practice = Factory(:practice, :name => 'Other Practice')
      practice_member = Factory(:practice_member, :practice_id => other_practice.id)

      get :main, { :id => practice_member.id, :visible_section => 'visit' }
      assigns(:practice_member).should == nil
      flash[:notice] = 'The requested action was invalid'
      response.should redirect_to('/home')
    end

  end

end
