class TravelCard < ActiveRecord::Base
  has_one :practice_member, :foreign_key => :id

  validates_presence_of :practice_member_id
end
