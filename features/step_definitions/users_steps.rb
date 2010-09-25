Given /^there are no comparisons in the system$/ do
  Comparison.delete_all
  Comparison.count.should == 0
end

Given /^there are no registered users$/ do
  User.delete_all
  User.count.should == 0
end

Given /^I am a registered user with the email (.+)$/ do |email|
  user = Factory.build(:user)
  user.email = email
  user.save
end

