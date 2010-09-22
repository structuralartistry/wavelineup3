require 'spec_helper'

describe User do

  describe "user role" do
    it "returns the role of the user" do
      user = Factory.build(:practice_user)
      user.role.should == 'practice'
      
      user = Factory.build(:sysadmin_user)
      user.role.should == 'sysadmin'
    end
  end

end
