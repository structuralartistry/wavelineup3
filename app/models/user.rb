class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :practice
  belongs_to :role
  
  validates_presence_of :role
  
  attr_accessible :email, :password, :password_confirmation, :perishable_token, :persistence_token, :practice_id, :role_id
   
  def deliver_activation_instructions!
    reset_perishable_token!
    SystemMailer.user_activation_instructions(self).deliver
  end
  
  def activate!
    self.active = true
    save
  end
  
  def deliver_welcome!
      reset_perishable_token!
      SystemMailer.user_welcome_email(self).deliver
  end
   
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    SystemMailer.password_reset_instructions(self).deliver  
  end
  
  
end
