class Invitation < ActiveRecord::Base
  belongs_to :referring_user, :class_name => 'User', :primary_key => 'id', :foreign_key => 'referring_user_id'
  
  validates_presence_of :email
  validates_format_of :email, :with => /[a-zA-Z0-9\._]*@[a-zA-Z0-9_]*\.[a-zA-Z0-9\._]*/
end
