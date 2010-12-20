class PracticeMember < ActiveRecord::Base
  belongs_to :practice
  has_many :travel_cards
  
  validates_presence_of :practice_id
  validates_presence_of :name_last
  validates_presence_of :name_first
  validates_uniqueness_of :name_first, :scope => [:name_first, :name_last]
  
  before_save :normalize_input
  after_create :create_travel_card_record
  
  def self.practice_members_global_count
    # global roster, no Demo Practice members included
    PracticeMember.includes("practice").where("practices.name<>'Demo Practice'").size
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
  
  def full_name_last_comma_first_middle_initial
    "#{self.name_last}, #{self.name_first} #{self.name_middle[0,1] if self.name_middle.length>=1}".strip
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
