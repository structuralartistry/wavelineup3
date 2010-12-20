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
  
  it { should have_many(:users) }
  it { should have_many(:practice_members) }
  
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  
  ['Practice Three', 'Practice3', 'Practice-Three'].each do |good_name|
    it { should allow_value(good_name).for(:name) }
  end
  
  ['Practice One&', 'Practice1.', 'Practice*One'].each do |bad_name|
    it { should_not allow_value(bad_name).for(:name) }
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
