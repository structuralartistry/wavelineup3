Given /^I am logged in in a "([^"]*)" user role$/ do |role|
  formal_role = role.gsub(/ /, '_')
  user = Factory.create( formal_role.to_sym, :email => formal_role + "@structuralartistry.com" )

  visit('/login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'password1')
  click_button('Submit')
  page.should have_content('Logout')
end

Given /^I am logged in in a "([^"]*)" user role for "([^"]*)"$/ do |role, practice_name|
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

