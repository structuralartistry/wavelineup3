class SystemMailer < ActionMailer::Base
  layout 'system_mailer'
  default :from => "wavelineup@structuralartistry.com"
  
  
  def user_activation_instructions(user)
    begin
      @user = user 
      @url = activations_url(user.perishable_token)
      mail(:to => user.email,  :subject => 'User activation for WaveLineup')  
    rescue Exception => e
      SystemError.new(:user_id => user.id, :error => 'Mailer error: user_activation_instructions', :incidentals => [:exception => e.to_s])
    end
  end
  
  def user_welcome_email(user)  
    begin
      @user = user 
      @url = self.root_url
      mail(:to => user.email,  :subject => 'Welcome to WaveLineup')  
    rescue Exception => e
      SystemError.new(:user_id => user.id, :error => 'Mailer error: user_welcome_email', :incidentals => [:exception => e.to_s])
    end
  end 
  
  def password_reset_instructions(user)
    begin
      @user = user
      @url = edit_password_reset_url(user.perishable_token)
      mail(:to => user.email, :subject => 'Password Reset for WaveLineup')   
    rescue Exception => e
      SystemError.new(:user_id => user.id, :error => 'Mailer error: password_reset_instructions', :incidentals => [:exception => e.to_s])
    end
  end
  
  def wavelineup_invitation(invitation)
    begin
      mail(:to => invitation.email, :subject => 'Invitation to WaveLineup Travel Card System for Network practitioners')
    rescue Exception => e
      SystemError.new(:user_id => nil, :error => 'Mailer error: wavelineup_invitation', :incidentals => [:exception => e.to_s])
    end
  end
  
  def generic_email(recipients, subject, body_content)
    begin
      @body_content = body_content
      mail(:to => recipients, :subject => subject)
    rescue Exception => e
      SystemError.new(:user_id => nil, :error => 'Mailer error: generic_email', :incidentals => [:exception => e.to_s])
    end
  end

end
