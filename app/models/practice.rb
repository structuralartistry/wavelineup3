class Practice < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  accepts_nested_attributes_for :users
  has_many :practice_members, :dependent => :destroy
  has_one :referring_practice, :class_name => 'Practice', :foreign_key => :referring_practice_id

  validates_uniqueness_of :name
  validates_presence_of :name
  validates_format_of :name, :with => /^[a-zA-Z0-9 -]*$/

  validates_presence_of :time_zone

  def my_practice_members
    PracticeMember.where("practice_id=#{self.id}").order("last_name, first_name")
  end

  def visit_count(lookback_period)
    PracticeMember.joins(:visits).where("practice_members.practice_id=#{self.id} AND visits.date > '#{Date.today - lookback_period}'").count
  end

  def self.get_all_restricted_by_user(requesting_user)
    return nil if !requesting_user
    if requesting_user.role.name == 'sysadmin'
      return Practice.all
    else
      return []
    end
  end

  def self.get_by_id_restricted_by_user(practice_id, requesting_user)
    return nil if !requesting_user
    if requesting_user.role.name == 'sysadmin'
      return Practice.find(practice_id)
    else
      return Practice.where("id=#{practice_id} AND id=#{requesting_user.practice_id}").first
    end
  end

end
