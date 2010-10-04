class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :practice
  belongs_to :role
  
  validates_presence_of :role
  
  attr_accessible :email, :password, :password_confirmation, :perishable_token, :persistence_token, :practice_id, :role_id
   
     
  def self.get_all_restricted_by_user_role_and_practice(user)
    return nil if !user
    if user.role.name == 'sysadmin'
      return User.all
    else
      return User.find_all_by_practice_id(user.practice_id)
    end
  end
   
  def self.get_by_id_restricted_by_user_role_and_practice(user_id, user)
    return nil if !user
    if user.role.name == 'sysadmin'
      return User.find(user_id)
    else
      return User.where("id=#{user_id} and practice_id=#{user.practice_id}").first
    end
  end
   
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
