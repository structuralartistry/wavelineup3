#require 'spec_helper'
#
#describe PracticeMember do
#
#  # before(:each) do
#  #   @practice = Factory(:practice_one)
#  #   #Factory.create(:practice_member, :practice_id => practice.id)
#  #   
#  #   
#  # end
#  
#  describe "create new Practice Member" do
#    it "should have a Last + First + Middle Name combination which is unique to the practice" do
#      practice = Factory.create(:practice_one)
#      practice_member = Factory.build(:practice_member, :practice_id => practice.id)
#      assert practice_member.save
#      practice_member.errors.count.should == 0
#      
#      practice_member = Factory.build(:practice_member, :practice_id => practice.id)
#      assert !practice_member.save
#      practice_member.errors.count.should == 1
#      practice_member.errors.on(:practice_member_name).should match "This name already exists in your Practice. Please modify if you want to save it."
#    end
#  end
#  
#  describe "get Practice Members" do
#    it "should only return Practice Members assigned to the current user's Practice" do
#      practice_one = Factory.create(:practice_one)
#      practice_member_practice_one = Factory.create(:practice_member, :practice_id => practice_one.id)
#      
#      practice_two = Factory.create(:practice_two)
#      practice_member_practice_two = Factory.create(:practice_member, :practice_id => practice_two.id)
#      
#      current_user = Factory.create(:practice_admin_user, :practice_id => practice_one.id)
#      
#      returned_practice_members = PracticeMember.get_all_restricted_by_user(current_user)
#      returned_members.size.should == 1
#      returned_practice_members.should == [practice_member_practice_one]
#    end
#  end
#  
#  describe "get practice member" do
#    it "should only return Practice Members if the practice member belongs to the current user's practice" do
#      practice_one = Factory.create(:practice_one)
#      practice_member_practice_one = Factory.create(:practice_member, :practice_id => practice_one.id)
#      
#      practice_two = Factory.create(:practice_two)
#      practice_member_practice_two = Factory.create(:practice_member, :practice_id => practice_two.id)
#      
#      current_user = Factory.create(:practice_admin_user, :practice_id => practice_one.id)
#      
#      # should return member of own practice
#      returned_practice_member = PracticeMember.get_by_id_restricted_by_user(practice_member_practice_one.id, current_user)
#      returned_practice_member.should == practice_member_practice_one
#      
#      # should not return member of other practice
#      returned_practice_member = PracticeMember.get_by_id_restricted_by_user(practice_member_practice_one.id, current_user)
#      returned_practice_member.should == nil
#    end
#  end
#
#end
