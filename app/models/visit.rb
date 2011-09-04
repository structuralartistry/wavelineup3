class Visit < ActiveRecord::Base
  belongs_to :practice_member
  belongs_to :visit_view_type

  validates_presence_of :practice_member_id
  validates_presence_of :visit_view_type_id

  validates_datetime :date, :after => 50.years.ago, :before => DateTime.now + 50.years, :message => 'must be a valid date'

  before_validation :set_visit_view_type

  def set_visit_view_type
    self.visit_view_type_id = VisitViewType.find_by_name('standard').id if !self.visit_view_type_id
  end

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
