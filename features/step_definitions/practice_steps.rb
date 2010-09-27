Given /^there are no registered practices or users$/ do
  Practice.delete_all
  Practice.count.should == 0
  
  User.delete_all
  User.count.should == 0
end

Given /^there is a practice in the system named "([^"]*)"$/ do |name|
  practice = Factory.create(:practice, :name => name)
  Factory.create(:user, :email => "#{name.downcase.gsub(' ', '')}@structuralartistry.com", :practice_id => practice.id)
end
