class Visit < ActiveRecord::Base
  belongs_to :practice_member

  validates_presence_of :practice_member_id

  validates_datetime :date, :after => 50.years.ago, :before => DateTime.now + 50.years, :message => 'must be a valid date'

  def self.get_by_id_restricted_by_user(visit_id, requesting_user)
    return nil if !requesting_user
    if requesting_user.role.name == 'sysadmin'
      return Visit.find(visit_id)
    else
      visit = Visit.find(visit_id)
      return visit if visit.practice_member.practice.id == requesting_user.practice.id
    end
    nil
  end

end
