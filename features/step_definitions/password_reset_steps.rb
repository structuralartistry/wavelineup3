Given /^I check my email for (.+) and follow the password reset link$/ do |email|
  user = User.find_by_email(email)
  visit(edit_password_reset_path(user.perishable_token))
end
