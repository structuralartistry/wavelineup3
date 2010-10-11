class PracticeMember < ActiveRecord::Base
  belongs_to :practice
  
  validates_presence_of :practice_id
  validates_presence_of :name_last
  validates_presence_of :name_first
  validate :validate_practice_member_full_name_does_not_exist_for_practice
  
  before_save :normalize_input
  after_create :create_travel_card_record
    
  def validate_practice_member_full_name_does_not_exist_for_practice
    if self.practice_id # dont bother if no practice id.... its a lost cause and the sql here will break
      self.id ? existing_id_clause = " and id<>#{self.id}" : existing_id_clause = ""
  
      existing_practice_member = PracticeMember.where("name_first='#{self.name_first}' and name_last='#{self.name_last}' and name_middle='#{self.name_middle}' and practice_id=#{self.practice_id}" + existing_id_clause)
      if existing_practice_member.size > 0
        self.errors.add(:practice_member_name, "already exists in your Practice")
      end
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
  
  def full_name_last_comma_first_middle
    (self.name_last + ', ' + self.name_first + ' ' + self.name_middle).strip
  end
  
  private
  
    def normalize_input
      self.name_first.capitalize!
      self.name_last.capitalize!
      self.name_middle.capitalize! if self.name_middle
    end

    def create_travel_card_record
      TravelCard.create(:practice_member_id => self.id)
    end
    
end
