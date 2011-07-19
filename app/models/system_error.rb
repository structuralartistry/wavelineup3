class SystemError < ActiveRecord::Base
  belongs_to :user

  after_save :notify_administrator_of

  private
  def notify_administrator_of
    sysadmin_user = User.find_by_role_id(Role.find_by_name('sysadmin').id)
    SystemMailer.generic_email(sysadmin_user.email, "Wavelineup Error: #{Rails.env} - #{self.error}", "#{self.incidentals}").deliver
  end

end
