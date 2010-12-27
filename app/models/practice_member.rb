class PracticeMember < ActiveRecord::Base
  belongs_to :practice
  has_many :travel_cards
  
  validates_presence_of :practice_id
  validates_presence_of :last_name
  validates_presence_of :first_name
  validates_uniqueness_of :first_name, :scope => [:first_name, :last_name, :middle_name, :practice_id], :message => 'has already been taken in combination with this middle and last name.'
  
  validates_format_of :last_name, :with => /^[a-zA-Z' -]*$/
  validates_format_of :first_name, :with => /^[a-zA-Z' -]*$/
  validates_format_of :middle_name, :with => /^[a-zA-Z' -]*$/
  
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
    "#{self.last_name}, #{self.first_name} #{self.middle_name[0,1] if self.middle_name.length>=1}".strip
  end
  
  private
  
    def normalize_input
      self.first_name.capitalize!
      self.last_name.capitalize!
      self.middle_name.capitalize! if self.middle_name
    end

    def create_travel_card_record
      TravelCard.create(:practice_member_id => self.id)
    end
    
end
