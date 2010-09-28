class SystemMailer < ActionMailer::Base
  default :from => "wavelineup@structuralartistry.com"
  
  
  def user_activation_instructions(user)
    @user = user 
    @url = activations_url(user.perishable_token)
    mail(:to => user.email,  :subject => 'User activation for WaveLineup')  
  end
  
  def user_welcome_email(user)  
    @user = user 
    @url = "https://wavelineup.structuralartistry.com"  
    mail(:to => user.email,  :subject => 'Welcome to WaveLineup')  
  end 
  
  def password_reset_instructions(user)
    @user = user
    @url = edit_password_reset_url(user.perishable_token)
    mail(:to => user.email, :subject => 'Password Reset for WaveLineup')    
  end

end
