require "spec_helper"

describe SystemMailer do

  it "successfully sends activation instructions to a new user" do
    user = Factory.build(:practice_user)
    user.save
    email = SystemMailer.user_activation_instructions(user).deliver
    ActionMailer::Base.deliveries.size.should == 1

    email.to.should == [user.email]
    email.subject.should == 'User activation for WaveLineup'
    email.encoded.should =~ /To activate your user please follow this link:<\/p>/
    email.encoded.should =~ /#{activations_url(user.perishable_token)}/
  end

  it "successfully sends a welcome email to a new user" do
    user = Factory.build(:practice_user)
    user.save
    email = SystemMailer.user_welcome_email(user).deliver
    ActionMailer::Base.deliveries.size.should == 1

    email.to.should == [user.email]
    email.subject.should == 'Welcome to WaveLineup!'
    email.encoded.should =~ /If you have forgotten your password, don't worry, you can reset it from the login page.<\/p>/
  end

  it "successfully sends password reset instructions to the requesting user" do
    user = Factory.create(:practice_user)
    user.perishable_token = "55555"
    user.save
    email = SystemMailer.password_reset_instructions(user).deliver
    ActionMailer::Base.deliveries.size.should == 1

    email.to.should == [user.email]
    email.subject.should == "Password Reset for WaveLineup"
    email.encoded.should =~ /Please follow this link to reset your password:/
  end

  it "successful sends an Invite to a potential Pratitioner" do
    invitation = Invitation.new
    invitation.email = 'dk.kahn@gmail.com'

    practice = Factory.create(:practice_one)
    user = Factory.create(:practice_user)
    user.practice_id = practice.id
    user.save
    invitation.referring_user_id = user.id

    email = SystemMailer.wavelineup_invitation(invitation).deliver
    ActionMailer::Base.deliveries.size.should == 1

    email.to.should == [invitation.email]
    email.subject.should == "Invitation to WaveLineup Travel Card System for Network practitioners"
    email.encoded.should =~ /WaveLineup is a free Travel Card and Visit tracking system/
    email.encoded.should =~ /register_referred\/#{invitation.token}/
  end

  it "successful sends a generic email" do
    recipients = 'dk.kahn@gmail.com'
    subject = 'Generic email'
    body_content = 'Generic content'

    email = SystemMailer.generic_email(recipients, subject, body_content).deliver
    ActionMailer::Base.deliveries.size.should == 1

    email.to.should == [recipients]
    email.subject.should == "Generic email"
    email.encoded.should =~ /Generic content/
  end

end
