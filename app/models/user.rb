class User < ActiveRecord::Base
  acts_as_authentic
  
  def role
    return 'sysadmin' if self.email == 'sysadmin@structuralartistry.com'
    'practice'
  end
end
