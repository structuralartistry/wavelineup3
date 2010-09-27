class Practice < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  accepts_nested_attributes_for :users
  
  validates_uniqueness_of :name
  validates_presence_of :name
end
