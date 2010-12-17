def parse_practice_member_formal_name(name_last_comma_name_first_name_middle)
  # returns a practice member with the name assigned
  # expects input: NAME_LAST, NAME_FIRST NAME_MIDDLE
  practice_member = PracticeMember.new
  practice_member.name_last = name_last_comma_name_first_name_middle.gsub(/,/, '').split[0]
  practice_member.name_first = name_last_comma_name_first_name_middle.gsub(/,/, '').split[1]
  practice_member.name_middle = name_last_comma_name_first_name_middle.gsub(/,/, '').split[2] || ''
  practice_member
end

def create_practice_member(practice_member_name, practice_name)
  practice_member = parse_practice_member_formal_name(practice_member_name)  
  practice_id = Practice.find_by_name(practice_name).id
  practice_member.practice_id = practice_id
  practice_member.save  
end
