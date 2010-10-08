Given /^I am a registered and activated user with the email "([^\"]*)"$/ do |email|
  
  Factory.create(:sysadmin_role)
  Factory.create(:practice_admin_role)
  Factory.create(:practice_user_role)
  
  practice = Factory.create(:practice_one)
  
  user = Factory.build(:user)
  user.email = email
  user.active = true
  user.practice_id = practice.id
  user.save
end

Given /^I am an inactive user with the email "([^\"]*)"$/ do |email|
  
  Factory.create(:sysadmin_role)
  Factory.create(:practice_admin_role)
  Factory.create(:practice_user_role)
  
  practice = Factory.create(:practice_one)
  
  user = Factory.build(:user)
  user.email = email
  user.active = false
  user.practice_id = practice.id
  user.save
end

Given /^I try to activate a non-existant user$/ do
  visit(activations_path("gobbldygook"))
end

# THESE (commented) go with a test I could not get to work... doing with making the User#perishable_token expire
# Given /^I have an expired activation code for the email address "([^\"]*)"$/ do |email|
#   user = User.find_by_email(email)
#   if !user
#     user = Factory.build(:user)
#     user.email = email
#   end
#   user.active = false  # assumed
#   
#   # expire the activation code... 
#   User.record_timestamps = false
#   user.updated_at = "2000-12-31 00:00:00"
#   User.record_timestamps = true
#   user.save
# end
# 
# When /^I try to activate my user with email address "([^\"]*)"$/ do |email|
#   user = User.find_by_email(email)
# debugger
#   visit(activations_url(user.perishable_token))
# end