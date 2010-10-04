require 'spec_helper'

describe UsersController do

  before(:all) do
    Factory.create(:sysadmin_role)
    practice_admin = Factory.create(:practice_admin_role)
    Factory.create(:practice_user_role, :practice_id => practice_admin.practice_id)
  end
  
  before(:each) do
    Practice.delete_all
  end
  
  describe "GET index" do
    it "does not load for guest role" do
      
    end
    
    it "loads for sysadmin role" do
      
    end
    
    it "loads for practice admin role" do
      
    end
    
    it "loads for practice user role" do 
      
    end
  end
  
  describe "GET new" do
    it "does not load for guest role" do
      
    end
    
    it "loads for sysadmin role" do
      
    end
    
    it "loads for practice admin role" do
      
    end
    
    it "loads for practice user role" do 
      
    end
  end
  
  describe "GET edit" do
    it "does not load for guest role" do
      
    end
    
    it "loads for sysadmin role" do
      
    end
    
    it "loads for practice admin role" do
      
    end
    
    it "loads for practice user role" do 
      
    end
  end
  
  describe "POST create" do
    it "does not load for guest role" do
      
    end
    
    it "loads for sysadmin role" do
      
    end
    
    it "loads for practice admin role" do
      
    end
    
    it "loads for practice user role" do 
      
    end    
  end
  
  describe "PUT update" do
    it "does not load for guest role" do
      
    end
    
    it "loads for sysadmin role" do
      
    end
    
    it "loads for practice admin role" do
      
    end
    
    it "loads for practice user role" do 
      
    end    
  end
  
  describe "DELETE destroy" do
    it "does not load for guest role" do
      
    end
    
    it "loads for sysadmin role" do
      
    end
    
    it "loads for practice admin role" do
      
    end
    
    it "loads for practice user role" do 
      
    end
  end
    
end


