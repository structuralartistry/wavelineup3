# note that here the practice member name should come in the format:  last first middle  or:  last, first middle
Given /^there is a Practice Member in my practice named "([^"]*)" by the name of "([^"]*)"$/ do |practice_name, practice_member_name|
  practice_id = Practice.find_by_name(practice_name)
  practice_member = PracticeMember.new(:practice_id => practice_id)
  practice_member.name_first = practice_member_name.gsub(/,/, '').split[0]
  practice_member.name_last = practice_member_name.gsub(/,/, '').split[1]
  practice_member.name_middle = practice_member_name.gsub(/,/, '').split[2] || ''
  practice_member.save
end