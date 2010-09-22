# Given /^I am logged in$/ do
#   user = Factory.create(:user) 
#   visit('/login')
#   fill_in('Login', :with => user.login)
#   fill_in('Password', :with => 'password1')
#   click_button('Submit')
#   page.should have_content('Logout')
# end
# 
# 
# When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"(?: within "([^\"]*)")?$/ do |field, value, selector|
#   with_scope(selector) do
#     fill_in(field, :with => value)
#   end
# end


Given /^I am logged in as a (.+) user$/ do |role|
  case role
  when 'sysadmin' then user = Factory.create(:sysadmin_user) 
  when 'practice' then user = Factory.create(:practice_user)
  end
  
  visit('/login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'password1')
  click_button('Submit')
  page.should have_content('Logout')
end

