require 'spec_helper'

describe PracticeMember do
  
  describe "practice member list text" do
    it "should format in Last Name, First Name Middle Name format" do
      practice_member = PracticeMember.new
      practice_member.name_last = "Kahn"
      practice_member.name_first = "David"
      practice_member.name_middle = "Nathan"
      practice_member.full_name_last_comma_first_middle.should == "Kahn, David Nathan"
    end
    
    it "should strip empty characters from start and end" do
      practice_member = PracticeMember.new
      practice_member.name_last = "Kahn"
      practice_member.name_first = "David"
      practice_member.name_middle = ""
      practice_member.full_name_last_comma_first_middle.should == "Kahn, David"      
    end
  end
  
  describe "create new Practice Member" do
    it "should have a Last + First + Middle Name combination which is unique to the practice" do
      practice = Factory.create(:practice_one)
      practice_member = Factory.build(:practice_member, :practice_id => practice.id)
      assert practice_member.save
      practice_member.errors.count.should == 0
      
      practice_member = Factory.build(:practice_member, :practice_id => practice.id)
      assert !practice_member.save
      practice_member.errors.count.should == 1
      practice_member.errors[:practice_member_name].should == ["Practice member name already exists in your Practice"]
    end
    
    it "should have a practice id assigned" do
      practice_member = Factory.build(:practice_member)
      practice_member.practice_id = nil
      practice_member.save.should == false
      practice_member.errors.should include(:practice_id)
      practice_member.practice_id = 1
      practice_member.save.should == true
    end

    it "should have both a first name and last name" do
      practice_member = Factory.build(:practice_member)
      practice_member.name_last = ""
      practice_member.name_first = ""
      practice_member.save.should == false
      practice_member.errors.should include(:name_last, :name_first)
      #practice_member.errors[:name_last].size.should == 1
      #practice_member.errors[:name_first].size.should == 1
      
      practice_member.name_last = "Pierce"
      practice_member.name_first = "Miriam"
      practice_member.save.should == true      
    end

  end
  
  describe "get Practice Members" do
    it "should only return Practice Members assigned to the current user's Practice" do
      practice_one = Factory.create(:practice_one)
      practice_member_practice_one = Factory.create(:practice_member, :practice_id => practice_one.id)
      
      practice_two = Factory.create(:practice_two)
      practice_member_practice_two = Factory.create(:practice_member, :practice_id => practice_two.id)
      
      current_user = Factory.create(:practice_admin_user, :practice_id => practice_one.id)
      
      returned_practice_members = PracticeMember.get_all_restricted_by_user(current_user)
      returned_practice_members.size.should == 1
      returned_practice_members.should == [practice_member_practice_one]
    end
  end
  
  describe "get practice member" do
    it "should only return Practice Members if the practice member belongs to the current user's practice" do
      practice_one = Factory.create(:practice_one)
      practice_member_practice_one = Factory.create(:practice_member, :practice_id => practice_one.id)
      
      practice_two = Factory.create(:practice_two)
      practice_member_practice_two = Factory.create(:practice_member, :practice_id => practice_two.id)
      
      current_user = Factory.create(:practice_admin_user, :practice_id => practice_one.id)
      
      # should return member of own practice
      returned_practice_member = PracticeMember.get_by_id_restricted_by_user(practice_member_practice_one.id, current_user)
      returned_practice_member.should == practice_member_practice_one
      
      # should not return member of other practice
      returned_practice_member = PracticeMember.get_by_id_restricted_by_user(practice_member_practice_two.id, current_user)
      returned_practice_member.should == nil
    end
  end

end
