require 'spec_helper'

describe InvitationsController do

  describe "POST create" do

    it "should return a notice on successful invitation creation" do
      invitation = Invitation.new(:email => 'some_person@gmail.com')
      Invitation.stub(:new).and_return(invitation)
      login_user('practice_admin_user')
      xhr :post, :create, { :invitation => { :email => invitation.email } }
      flash[:notice].should eq("An invite has been sent to #{invitation.email}")
    end

  end

end
