require 'spec_helper'

describe User do
  
  before(:all) do
    Factory.create(:sysadmin_role)
    Factory.create(:practice_admin_role)
    Factory.create(:practice_user_role)      
  end
  
  before(:each) do
    Practice.delete_all
    
    practice_one = Factory.create(:practice_one)
    practice_two = Factory.create(:practice_two)
    
    Factory.create(:practice_admin_user, :practice_id => practice_one.id)
    Factory.create(:practice_user, :practice_id => practice_one.id)
    Factory.create(:practice_admin_user, :practice_id => practice_two.id)
    Factory.create(:practice_user, :practice_id => practice_two.id)
  end
  
  describe "get users" do
    
    it "returns nothing if the user is in the guest role" do
      users = User.get_all_restricted_by_user_role_and_practice(nil)
      users.should == nil
    end
    
    it "returns all users if requester is in the sysadmin role" do 
      current_user = Factory.create(:sysadmin_user)
      
      users = User.get_all_restricted_by_user_role_and_practice(current_user)
      users.size.should == 5
    end
    
    it "returns all users associated to the requesters practice if the requester is in the practice admin role" do
      current_user = User.includes("role").limit("1").where("roles.name='practice admin'").first
      
      users = User.get_all_restricted_by_user_role_and_practice(current_user)
      users.size.should == 2
    end
    
    it "returns all users associated to the requesters practice if the requester is in the practice user role" do
      current_user = User.includes("role").limit("1").where("roles.name='practice user'").first
      
      users = User.get_all_restricted_by_user_role_and_practice(current_user)
      users.size.should == 2
    end
  end
  
  describe "get user" do
    it "returns nothing if the user is in the guest role" do
      user_to_find = User.includes("role").where("roles.name != 'sysadmin'").first
      
      returned_user = User.get_by_id_restricted_by_user_role_and_practice(user_to_find.id, nil)
      returned_user.should == nil
    end
    
    it "returns any user if the requester is in the sysadmin role" do 
      current_user = Factory.create(:sysadmin_user)
      
      user_to_find = User.includes("role").where("roles.name!='sysadmin'").first
      
      returned_user = User.get_by_id_restricted_by_user_role_and_practice(user_to_find.id, current_user)
      returned_user.should == user_to_find
    end
    
    it "returns any user associated to the requesters practice if the requester is in the practice admin role" do
      current_user = User.includes("role").limit("1").where("roles.name='practice admin'").first
      
      # user in the practice
      user_to_find = User.where("practice_id=#{current_user.practice_id}").first
      returned_user = User.get_by_id_restricted_by_user_role_and_practice(user_to_find.id, current_user)
      returned_user.should == user_to_find
      
      # user not in the practice
      user_to_find = User.where("practice_id!=#{current_user.practice_id}").first
      returned_user = User.get_by_id_restricted_by_user_role_and_practice(user_to_find.id, current_user)
      returned_user.should == nil
    end
    
    it "returns any user associated to the requesters practice if the requester is in the practice user role" do
      current_user = User.includes("role").limit("1").where("roles.name='practice user'").first
      
      # user in the practice
      user_to_find = User.where("practice_id=#{current_user.practice_id}").first
      returned_user = User.get_by_id_restricted_by_user_role_and_practice(user_to_find.id, current_user)
      returned_user.should == user_to_find
      
      # user not in the practice
      user_to_find = User.where("practice_id!=#{current_user.practice_id}").first
      returned_user = User.get_by_id_restricted_by_user_role_and_practice(user_to_find.id, current_user)
      returned_user.should == nil      
    end    
  end

end
