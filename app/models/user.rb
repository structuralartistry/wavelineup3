class User < ActiveRecord::Base
  acts_as_authentic
  
  def role
    return 'sysadmin' if self.email == 'sysadmin@structuralartistry.com'
    'practice'
  end
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    SystemMailer.password_reset_instructions(self).deliver  
  end
end
