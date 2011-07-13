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
  it { should have_one(:referring_practice) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:time_zone) }

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
    @practice.practice_members.count.should == 1
  end

  it "gets a count of visits in the last 30 days" do
    practice_member_one = Factory.create(:practice_member, :practice_id => @practice.id)
    Factory.create(:visit, :practice_member_id => practice_member_one.id)
    practice_member_two = Factory.create(:practice_member, :practice_id => @practice.id)
    Factory.create(:visit, :practice_member_id => practice_member_two.id, :date => DateTime.now - 32.days)
    @practice.visit_count(30.days).should == 1
    @practice.visit_count(35.days).should == 2
  end

  it "gets practices restricted by the current user" do
    practice_one = @practice
    practice_two = Factory(:practice_two)
    user_one = Factory(:practice_admin_user, :practice => practice_one)
    user_two = Factory(:practice_admin_user, :practice => practice_two)
    sysadmin_user = Factory(:sysadmin_user)

    Practice.get_all_restricted_by_user(user_one).size.should == 0
    Practice.get_all_restricted_by_user(user_two).size.should == 0

    Practice.get_all_restricted_by_user(sysadmin_user).size.should == 2
    Practice.get_all_restricted_by_user(sysadmin_user).size.should == 2
  end

  it "gets a practice, restricted by the current user" do
    practice_one = @practice
    practice_two = Factory(:practice_two)
    user_one = Factory(:practice_admin_user, :practice => practice_one)
    user_two = Factory(:practice_admin_user, :practice => practice_two)
    sysadmin_user = Factory(:sysadmin_user)

    Practice.get_by_id_restricted_by_user(practice_one.id, user_one).id.should == practice_one.id
    Practice.get_by_id_restricted_by_user(practice_one.id, user_two).should == nil

    Practice.get_by_id_restricted_by_user(practice_one.id, sysadmin_user).id.should == practice_one.id
    Practice.get_by_id_restricted_by_user(practice_two.id, sysadmin_user).id.should == practice_two.id
  end

end
