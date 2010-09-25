Given /^I check my email for (.+) and follow the password reset link$/ do |email|
  user = User.find_by_email(email)
  visit("http://localhost:3000/password_resets/#{user.perishable_token}/edit")
end
