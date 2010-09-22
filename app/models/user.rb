class User < ActiveRecord::Base
  acts_as_authentic
  
  def role
    return 'sysadmin' if self.login == 'sysadmin'
    'practice'
  end
end
