require 'spec_helper'

describe Practice do
  it "deletes all associated users when it is deleted" do
    User.delete_all
    Practice.delete_all
    
    User.count.should == 0
    Practice.count.should == 0
    practice = Factory.create(:practice_one)
    user1 = Factory.create(:practice_admin_user, :practice_id => practice.id)
    user2 = Factory.create(:practice_user, :practice_id => practice.id)
    User.count.should == 2
    practice.destroy
    Practice.count.should == 0
    User.count.should == 0
  end
end
