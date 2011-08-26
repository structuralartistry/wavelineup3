require 'spec_helper'

describe FeedbackSupportsController do

  describe "POST create" do

    it "should return a notice on successful feedback support message creation" do
      feedback_support = FeedbackSupport.new(:message => 'something')
      feedback_support.stub(:send_email_notification_to_sysadmin).and_return(true)
      FeedbackSupport.stub(:new).and_return(feedback_support)
      login_user('practice_admin_user')
      xhr :post, :create, { :feedback_support => { :message => 'some message' } }
      flash[:notice].should eq('Thanks for your message. We will respond promptly!')
    end

  end

end
