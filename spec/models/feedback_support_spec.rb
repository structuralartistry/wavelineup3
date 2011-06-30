require 'spec_helper'

describe FeedbackSupport do

  it { should belong_to(:user) }
  it { should validate_presence_of(:message) }

  it "should send an email to the sysadmin notifying them of a new message" do
    Factory(:sysadmin_user)

    ActionMailer::Base.deliveries=[]
    ActionMailer::Base.deliveries.size.should == 0
    feedback_support = Factory.build(:feedback_support)
    feedback_support.save!
    ActionMailer::Base.deliveries.size.should == 1
  end

end

