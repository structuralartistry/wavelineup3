class Visit < ActiveRecord::Base
  belongs_to :practice_member
  
  validates_presence_of :practice_member_id
  
  validates_date :entrainment_date, :after => 50.years.ago, :before => Date.today + 50.years, :message => 'must be a valid date'  
end
