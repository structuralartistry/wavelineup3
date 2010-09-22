Given /^I am logged in$/ do
  user = Factory.create(:user) 
  visit('/login')
  fill_in('Login', :with => user.login)
  fill_in('Password', :with => 'password1')
  click_button('Submit')
  page.should have_content('Logout')
end
