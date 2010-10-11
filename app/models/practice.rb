class Practice < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  accepts_nested_attributes_for :users
  has_many :practice_members
  
  validates_uniqueness_of :name
  validates_presence_of :name
  
  def practice_members
    PracticeMember.find_all_by_practice_id(self.id)
  end
end
