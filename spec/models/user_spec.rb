require 'spec_helper'

describe User do
  
  before(:all) do
    Factory.create(:sysadmin_role)
    Factory.create(:practice_admin_role)
    Factory.create(:practice_user_role)      
  end
  
  before(:each) do
    practice = Factory.create(:practice_one)
    Factory.create(:practice_admin_user, :practice_id => practice.id)
  end
  
  it { should belong_to(:practice) }
  it { should belong_to(:role) }
  
  it { should validate_presence_of(:role) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('david.nathan_kahn@gmail.com.mx').for(:email) }
  it { should_not allow_value('david nathan kahn at gmail dot com').for(:email) }
  
   
  describe "user authorization - guest role" do
    it "is authorized to access certain pages only" do
      user = User.new
      user.authorize('activations', 'create')[:success].should == true
      user.authorize('home', 'index')[:success].should == false
      user.authorize('password_resets', 'new')[:success].should == true
      user.authorize('password_resets', 'create')[:success].should == true
      user.authorize('password_resets', 'edit')[:success].should == true
      user.authorize('password_resets', 'update')[:success].should == true
      user.authorize('practice_members', 'index')[:success].should == false
      user.authorize('practice_members', 'new')[:success].should == false
      user.authorize('practice_members', 'edit')[:success].should == false
      user.authorize('practice_members', 'create')[:success].should == false
      user.authorize('practice_members', 'update')[:success].should == false
      user.authorize('practice_members', 'destroy')[:success].should == false
      user.authorize('practices', 'index')[:success].should == false
      user.authorize('practices', 'new')[:success].should == true
      user.authorize('practices', 'edit')[:success].should == false
      user.authorize('practices', 'create')[:success].should == true
      user.authorize('practices', 'update')[:success].should == false
      user.authorize('practices', 'destroy')[:success].should == false
      user.authorize('travel_cards', 'edit')[:success].should == false
      user.authorize('travel_cards', 'update')[:success].should == false
      user.authorize('user_sessions', 'new')[:success].should == true
      user.authorize('user_sessions', 'create')[:success].should == true
      user.authorize('user_sessions', 'destroy')[:success].should == false
      user.authorize('users', 'new')[:success].should == false
      user.authorize('users', 'edit')[:success].should == false
      user.authorize('users', 'create')[:success].should == false
      user.authorize('users', 'update')[:success].should == false
      user.authorize('users', 'destroy')[:success].should == false
    end
  end

  describe "user authorization - sysadmin role" do
    it "is authorized to access certain pages only" do
      user = Factory.create(:sysadmin_user)
      user.authorize('activations', 'create')[:success].should == false
      user.authorize('home', 'index')[:success].should == true
      user.authorize('password_resets', 'new')[:success].should == false
      user.authorize('password_resets', 'create')[:success].should == false
      user.authorize('password_resets', 'edit')[:success].should == false
      user.authorize('password_resets', 'update')[:success].should == false
      user.authorize('practice_members', 'index')[:success].should == true
      user.authorize('practice_members', 'new')[:success].should == true
      user.authorize('practice_members', 'edit')[:success].should == true
      user.authorize('practice_members', 'create')[:success].should == true
      user.authorize('practice_members', 'update')[:success].should == true
      user.authorize('practice_members', 'destroy')[:success].should == true
      user.authorize('practices', 'index')[:success].should == true
      user.authorize('practices', 'new')[:success].should == false
      user.authorize('practices', 'edit')[:success].should == true
      user.authorize('practices', 'create')[:success].should == false
      user.authorize('practices', 'update')[:success].should == true
      user.authorize('practices', 'destroy')[:success].should == true
      user.authorize('travel_cards', 'edit')[:success].should == true
      user.authorize('travel_cards', 'update')[:success].should == true
      user.authorize('user_sessions', 'new')[:success].should == false
      user.authorize('user_sessions', 'create')[:success].should == false
      user.authorize('user_sessions', 'destroy')[:success].should == true
      user.authorize('users', 'new')[:success].should == true
      user.authorize('users', 'edit')[:success].should == true
      user.authorize('users', 'create')[:success].should == true
      user.authorize('users', 'update')[:success].should == true
      user.authorize('users', 'destroy')[:success].should == true
    end
  end
  
  describe "user authorization - practice admin role" do
    it "is authorized to access certain pages only" do
      user = Factory.create(:practice_admin_user)
      user.authorize('activations', 'create')[:success].should == false
      user.authorize('home', 'index')[:success].should == true
      user.authorize('password_resets', 'new')[:success].should == false
      user.authorize('password_resets', 'create')[:success].should == false
      user.authorize('password_resets', 'edit')[:success].should == false
      user.authorize('password_resets', 'update')[:success].should == false
      user.authorize('practice_members', 'index')[:success].should == true
      user.authorize('practice_members', 'new')[:success].should == true
      user.authorize('practice_members', 'edit')[:success].should == true
      user.authorize('practice_members', 'create')[:success].should == true
      user.authorize('practice_members', 'update')[:success].should == true
      user.authorize('practice_members', 'destroy')[:success].should == true
      user.authorize('practices', 'index')[:success].should == false
      user.authorize('practices', 'new')[:success].should == false
      user.authorize('practices', 'edit')[:success].should == true
      user.authorize('practices', 'create')[:success].should == false
      user.authorize('practices', 'update')[:success].should == true
      user.authorize('practices', 'destroy')[:success].should == false
      user.authorize('travel_cards', 'edit')[:success].should == true
      user.authorize('travel_cards', 'update')[:success].should == true
      user.authorize('user_sessions', 'new')[:success].should == false
      user.authorize('user_sessions', 'create')[:success].should == false
      user.authorize('user_sessions', 'destroy')[:success].should == true
      user.authorize('users', 'new')[:success].should == true
      user.authorize('users', 'edit')[:success].should == true
      user.authorize('users', 'create')[:success].should == true
      user.authorize('users', 'update')[:success].should == true
      user.authorize('users', 'destroy')[:success].should == true
    end
  end
  
  describe "user authorization - practice user role" do
    it "is authorized to access certain pages only" do
      user = Factory.create(:practice_user)
      user.authorize('activations', 'create')[:success].should == false
      user.authorize('home', 'index')[:success].should == true
      user.authorize('password_resets', 'new')[:success].should == false
      user.authorize('password_resets', 'create')[:success].should == false
      user.authorize('password_resets', 'edit')[:success].should == false
      user.authorize('password_resets', 'update')[:success].should == false
      user.authorize('practice_members', 'index')[:success].should == true
      user.authorize('practice_members', 'new')[:success].should == true
      user.authorize('practice_members', 'edit')[:success].should == true
      user.authorize('practice_members', 'create')[:success].should == true
      user.authorize('practice_members', 'update')[:success].should == true
      user.authorize('practice_members', 'destroy')[:success].should == true
      user.authorize('practices', 'index')[:success].should == false
      user.authorize('practices', 'new')[:success].should == false
      user.authorize('practices', 'edit')[:success].should == true
      user.authorize('practices', 'create')[:success].should == false
      user.authorize('practices', 'update')[:success].should == true
      user.authorize('practices', 'destroy')[:success].should == false
      user.authorize('travel_cards', 'edit')[:success].should == true
      user.authorize('travel_cards', 'update')[:success].should == true
      user.authorize('user_sessions', 'new')[:success].should == false
      user.authorize('user_sessions', 'create')[:success].should == false
      user.authorize('user_sessions', 'destroy')[:success].should == true
      user.authorize('users', 'new')[:success].should == true
      user.authorize('users', 'edit')[:success].should == true
      user.authorize('users', 'create')[:success].should == true
      user.authorize('users', 'update')[:success].should == true
      user.authorize('users', 'destroy')[:success].should == true
    end
  end
  
  
  describe "access to user data" do
    
    before(:each) do
      User.delete_all
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
        users = User.get_all_restricted_by_user(nil)
        users.should == nil
      end
      
      it "returns all users if requester is in the sysadmin role" do 
        current_user = Factory.create(:sysadmin_user)
        
        users = User.get_all_restricted_by_user(current_user)
        users.size.should == 5
      end
      
      it "returns all users associated to the requesters practice if the requester is in the practice admin role" do
        current_user = User.includes("role").limit("1").where("roles.name='practice admin'").first
        
        users = User.get_all_restricted_by_user(current_user)
        users.size.should == 2
      end
      
      it "returns all users associated to the requesters practice if the requester is in the practice user role" do
        current_user = User.includes("role").limit("1").where("roles.name='practice user'").first
        
        users = User.get_all_restricted_by_user(current_user)
        users.size.should == 2
      end
    end
    
    describe "get user" do
      it "returns nothing if the user is in the guest role" do
        user_to_find = User.includes("role").where("roles.name != 'sysadmin'").first
        
        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, nil)
        returned_user.should == nil
      end
      
      it "returns any user if the requester is in the sysadmin role" do 
        current_user = Factory.create(:sysadmin_user)
        
        user_to_find = User.includes("role").where("roles.name!='sysadmin'").first
        
        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, current_user)
        returned_user.should == user_to_find
      end
      
      it "returns any user associated to the requesters practice if the requester is in the practice admin role" do
        current_user = User.includes("role").limit("1").where("roles.name='practice admin'").first
        
        # user in the practice
        user_to_find = User.where("practice_id=#{current_user.practice_id}").first
        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, current_user)
        returned_user.should == user_to_find
        
        # user not in the practice
        user_to_find = User.where("practice_id!=#{current_user.practice_id}").first
        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, current_user)
        returned_user.should == nil
      end
      
      it "returns any user associated to the requesters practice if the requester is in the practice user role" do
        current_user = User.includes("role").limit("1").where("roles.name='practice user'").first
        
        # user in the practice
        user_to_find = User.where("practice_id=#{current_user.practice_id}").first
        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, current_user)
        returned_user.should == user_to_find
        
        # user not in the practice
        user_to_find = User.where("practice_id!=#{current_user.practice_id}").first
        returned_user = User.get_by_id_restricted_by_user(user_to_find.id, current_user)
        returned_user.should == nil      
      end
      
    end
    
  end

  describe "ability to create a practice member" do
    it "can not create a practice member if in sysadmin role" do
      user = Factory.create(:sysadmin_user)
      user.can_create_a_practice_member?.should == false
    end
    
    it "can create a practice member if in practice admin role" do
      user = Factory.create(:practice_admin_user)
      user.can_create_a_practice_member?.should == true
    end
    
    it "can create a practice member if is in the practice user role" do
      user = Factory.create(:practice_user)
      user.can_create_a_practice_member?.should == true
    end
  end

end
