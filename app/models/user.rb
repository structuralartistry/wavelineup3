class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :practice
  belongs_to :role
  
  validates_presence_of :role
    
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    SystemMailer.password_reset_instructions(self).deliver  
  end
end
