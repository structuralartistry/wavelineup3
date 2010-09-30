Given /^I am a registered user with the email "([^\"]*)"$/ do |email|
  user = Factory.build(:user)
  user.email = email
  user.active = true
  user.save
end

