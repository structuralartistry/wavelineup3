# require 'spec_helper'
# 
# describe User do
#   
#   describe "get users" do
#     
#     before(:each) do
#       Practice.delete_all
#       
#       Factory.create(:sysadmin)
#       
#       Factory.create(:practice_admin)
#       Factory.create(:practice_user)
#       Factory.create(:practice_admin_two)
#       Factory.create(:practice_user_two)
#       
#       Factory.create(:sysadmin_role)
#       
#       practice_admin = Factory.create(:practice_admin_role)
#       Factory.create(:practice_user_role, :practice_id => practice_admin.practice_id)
#       
#       practice_admin = Factory.create(:practice_admin_role)
#       Factory.create(:practice_user_role, :practice_id => practice_admin.practice_id)
#       
#       
#     end
#     
#     it "returns nothing if the user is in the guest role" do
#       User.get_all_restricted_by_user_role_and_practice(nil)
#     end
#     
#     it "returns all users if requester is in the sysadmin role" do 
#       user = find_by_role_name('sysadmin')
#       
#       users = User.get_all_restricted_by_user_role_and_practice(nil)
#       users.size.should == 5
#     end
#     
#     it "returns all users associated to the requesters practice if the requester is in the practice admin role" do
#       
#     end
#     
#     it "returns all users associated to the requesters practice if the requester is in the practice user role" do
#       
#     end
#   end
#   
#   describe "get user" do
#     it "returns nothing if the user is in the guest role" do
#       
#     end
#     
#     it "returns any user if the requester is in the sysadmin role" do 
#     
#     end
#     
#     it "returns any user associated to the requesters practice if the requester is in the practice admin role" do
#       
#     end
#     
#     it "returns any user associated to the requesters practice if the requester is in the practice user role" do
#       
#     end    
#     
#   end
# 
# end
