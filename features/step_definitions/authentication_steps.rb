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
  formal_role = role.gsub(/ /, '_')
  user = Factory.create( formal_role.to_sym, :email => formal_role + "@structuralartistry.com" )

  if practice_name
    practice = Practice.find(user.practice_id)
    practice.name = practice_name
    practice.save
  end

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
  user.active = true
#  visit("http://localhost:3000/password_resets/#{user.perishable_token}/edit")
end

Given /^I am logged in as a "([^"]*)" user role with the email "([^"]*)"$/ do |role, email|
  formal_role = role.gsub(/ /, '_')
debugger
  user = Factory.create( formal_role.to_sym, :email => email )

  visit('/login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'password1')
  click_button('Submit')
  page.should have_content('Logout')
end



