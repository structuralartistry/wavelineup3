Given /^I am logged in in a "([^"]*)" user role$/ do |role|
  formal_role = role.gsub(/ /, '_')
  user = Factory.create( formal_role.to_sym, :email => formal_role + "@structuralartistry.com" )

  visit('/login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'password1')
  click_button('Submit')
  page.should have_content('Logout')
end

Given /^I am logged in in a "([^"]*)" user role for the practice "([^"]*)"$/ do |role, practice_name|
  practice = Factory.create(:practice, :name => practice_name)
  
  formal_role = role.gsub(/ /, '_')
  user = Factory.create( formal_role.to_sym, :email => formal_role + "@structuralartistry.com", :practice_id => practice.id )

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
  visit(activations_url(user.perishable_token))
end

Given /^I am logged in with the email "([^"]*)"$/ do |email|
  user = User.find_by_email(email)

  visit('/login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'password1')
  click_button('Submit')
  page.should have_content('Logout')
end



