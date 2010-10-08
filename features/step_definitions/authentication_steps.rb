Given /^I am logged in in a "([^"]*)" user role$/ do |role|
  Factory.create(:sysadmin_role)
  Factory.create(:practice_admin_role)
  Factory.create(:practice_user_role)

  practice = Factory.create(:practice, :name => "Practice One")

  user_factory_name = role.gsub(/ /, '_')
  user_factory_name += '_user' if user_factory_name == "sysadmin"
  user_factory_name += '_user' if user_factory_name == "practice_admin"
  user = Factory.create( user_factory_name.to_sym, :email => user_factory_name + "@structuralartistry.com", :practice_id => practice.id )

  visit('/login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'password1')
  click_button('Submit')
  page.should have_content('Logout')
end

Given /^I am logged in in a "([^"]*)" user role for the practice "([^"]*)"$/ do |role, practice_name|
  Factory.create(:sysadmin_role)
  Factory.create(:practice_admin_role)
  Factory.create(:practice_user_role)
  
  practice = Factory.create(:practice, :name => practice_name)
  
  user_factory_name = role.gsub(/ /, '_')
  user_factory_name += '_user' if user_factory_name == "sysadmin"
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



