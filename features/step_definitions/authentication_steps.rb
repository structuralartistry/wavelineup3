Then /^I should see the login fields$/ do
  assert page.has_xpath?("//h1[text()='Login']")
  assert page.has_xpath?("//label[text()='Email']")
  assert page.has_xpath?("//label[text()='Password']") 
  Then "I should see \"Create My Practice\" within a selector cell" 
  assert page.should have_no_content("Logout")
  assert page.has_no_xpath?("//td[(@class='selector_cell_nav') and (text()='Login')]")
end

When /^I login with email "([^"]*)" and password "([^"]*)"$/ do |email, password|  
  visit('/login')
  fill_in('Email', :with => email)
  fill_in('Password', :with => password)
  click_button('Submit')
end

# sysadmin gets own step as only sysadmin should not have a practice... all other 'role' based login steps should define a practice name
Given /^I am logged in in a "sysadmin" user role$/ do
  Factory.create(:sysadmin_role)

  user = Factory.create( :sysadmin_user, :email => "sysadmin_user@structuralartistry.com" )

  visit('/login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'password1')
  click_button('Submit')
  page.should have_content('Logout')
end

Given /^I am logged in in a "([^"]*)" user role for the practice "([^"]*)"$/ do |role, practice_name|
  Factory.create(:practice_admin_role)
  Factory.create(:practice_user_role)
  
  practice = Practice.find_by_name(practice_name)
  practice = Factory.create(:practice, :name => practice_name) if !practice
  
  user_factory_name = role.gsub(/ /, '_')
  user_factory_name += '_user' if user_factory_name == "practice_admin"
  user = Factory.create( user_factory_name.to_sym, :email => user_factory_name + "@structuralartistry.com", :practice_id => practice.id )

  visit('/login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'password1')
  click_button('Submit')
  page.should have_content('Logout')
end

Given /^I am not logged in$/ do
  visit('/logout')
  page.should have_content("Login")
end

Given /^I check my email "([^"]*)" and activate my user$/ do |email|
  user = User.find_by_email(email)
  visit(activations_path(user.perishable_token))
end

Given /^I am logged in with the email "([^"]*)"$/ do |email|
  user = User.find_by_email(email)

  visit('/login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'password1')
  click_button('Submit')
  page.should have_content('Logout')
end



