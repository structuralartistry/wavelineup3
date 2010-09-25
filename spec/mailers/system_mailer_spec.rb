require "spec_helper"

describe SystemMailer do  
  
  it "successfully sends a welcome email to a new user" do
    user = Factory.build(:practice_user)
    user.save
    email = SystemMailer.user_welcome_email(user).deliver
    ActionMailer::Base.deliveries.size.should == 1
    
    email.to.should == [user.email]
    email.subject.should == 'Welcome to WaveLineup'
    email.encoded.should =~ /Welcome to WaveLineup, #{user.email}/ 
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

end
