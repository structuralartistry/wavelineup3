require 'spec_helper'

describe Practice do
  
  before(:each) do
    User.delete_all
    Practice.delete_all
    
    User.count.should == 0
    Practice.count.should == 0
    @practice = Factory.create(:practice_one)
    user1 = Factory.create(:practice_admin_user, :practice_id => @practice.id)
    user2 = Factory.create(:practice_user, :practice_id => @practice.id)
    User.count.should == 2
  end
    
  it "deletes all associated users when it is deleted" do
    @practice.destroy
    Practice.count.should == 0
    User.count.should == 0
  end
  
  it "has a roster of practice members" do
    practice_member_one = Factory.create(:practice_member, :practice_id => @practice.id)
    @practice.my_practice_members.size.should == 1
  end
  
end
