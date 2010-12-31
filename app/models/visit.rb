class Visit < ActiveRecord::Base
  belongs_to :practice_member
  
  validates_presence_of :date
  validates_format_of :date, :with => /[0-9]{4}\-[0-9]{2}\-[0-9]{2}/, :message => 'must be in format YYYY-MM-DD'
end
