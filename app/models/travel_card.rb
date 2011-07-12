class TravelCard < ActiveRecord::Base
  has_one :practice_member, :primary_key => :practice_member_id, :foreign_key => :id

  validates_presence_of :practice_member_id

  def self.get_by_id_restricted_by_user(travel_card_id, requesting_user)
    return nil if !requesting_user
    if requesting_user.role.name == 'sysadmin'
      return TravelCard.find(travel_card_id)
    else
      travel_card = TravelCard.find(travel_card_id)
      return travel_card if travel_card.practice_member.practice.id == requesting_user.practice.id
    end
    nil
  end
end
