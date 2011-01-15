class Visit < ActiveRecord::Base
  belongs_to :practice_member
  
  validates_presence_of :practice_member_id
  
  validates_datetime :date, :after => 50.years.ago, :before => DateTime.now + 50.years, :message => 'must be a valid date'  
end
