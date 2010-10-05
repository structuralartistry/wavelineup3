class PracticeMember < ActiveRecord::Base
  
  validate :validate_practice_member
  
  def validate_practice_member    
    existing_practice_member = PracticeMember.where("name_first='#{self.name_first}' and name_last='#{self.name_last}' and name_middle='#{self.name_middle}' and practice_id=#{self.practice_id}")
    if existing_practice_member.size >0
      self.errors.add(:practice_member_name, "This Practice Member name already exists in your Practice. Please modify it to be different if you want to save it.")
    end
  end
  
  def self.get_all_restricted_by_user(requesting_user)
    return nil if !requesting_user
    if requesting_user.role.name == 'sysadmin'
      return PracticeMember.all
    else
      return PracticeMember.find_all_by_practice_id(requesting_user.practice_id)
    end  
  end
  
  def self.get_by_id_restricted_by_user(practice_member_id, requesting_user)
    return nil if !requesting_user
    if requesting_user.role.name == 'sysadmin'
      return PracticeMember.find(practice_member_id)
    else
      return PracticeMember.where("id=#{practice_member_id} and practice_id=#{requesting_user.practice_id}").first
    end
  end
    
end
