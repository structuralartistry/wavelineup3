Given /^there are no comparisons in the system$/ do
  Comparison.delete_all
  Comparison.count.should == 0
end

Given /^there are no registered users$/ do
  User.delete_all
  User.count.should == 0
end
