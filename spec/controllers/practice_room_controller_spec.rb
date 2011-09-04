require 'spec_helper'

describe PracticeRoomController do

  describe "GET main" do

    before(:each) do
      Factory(:visit_view_type)
      user = login_user('practice_admin_user')
      @practice_member = Factory(:practice_member, :practice => user.practice)
    end

    it "should assign a practice member in the current user's practice" do
      get :main, { :id => @practice_member.id, :visible_section => 'visit' }
      assigns(:practice_member).should == @practice_member
    end

    it "should create a new visit if requested" do
      get :main, { :id => @practice_member.id, :visible_section => 'visit', :visit_id => 'new' }
      assigns(:visit).id.should_not eq(nil)
    end

    it "should not assign a practice member not in the current user's practice" do
      other_practice = Factory(:practice, :name => 'Other Practice')
      practice_member = Factory(:practice_member, :practice_id => other_practice.id)

      get :main, { :id => practice_member.id, :visible_section => 'visit' }
      assigns(:practice_member).should == nil
      flash[:notice] = 'The requested action was invalid'
      response.should redirect_to('/home')
    end

  end

end
