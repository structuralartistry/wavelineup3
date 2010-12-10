class Practice < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  accepts_nested_attributes_for :users
  has_many :practice_members
  
  validates_uniqueness_of :name
  validates_presence_of :name
    
  def my_practice_members
    PracticeMember.where("practice_id=#{self.id}").order("name_last, name_first").all
  end
end
