def parse_practice_member_formal_name(last_name_comma_first_name_middle_name)
  # returns a practice member with the name assigned
  # expects input: last_name, NAME_FIRST NAME_MIDDLE
  practice_member = PracticeMember.new
  practice_member.last_name = last_name_comma_first_name_middle_name.gsub(/,/, '').split[0]
  practice_member.first_name = last_name_comma_first_name_middle_name.gsub(/,/, '').split[1]
  practice_member.middle_name = last_name_comma_first_name_middle_name.gsub(/,/, '').split[2] || ''
  practice_member
end

# note that here the practice member name should come in the format:  last first middle  or:  last, first middle
Given /^there is a Practice Member in my practice named "([^"]*)" by the name of "([^"]*)"$/ do |practice_name, practice_member_name|
  practice_member = parse_practice_member_formal_name(practice_member_name)  
  practice_id = Practice.find_by_name(practice_name).id
  practice_member.practice_id = practice_id
  practice_member.save
end