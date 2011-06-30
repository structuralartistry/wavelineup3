class FeedbackSupport < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :message

  after_save :send_email_notification_to_sysadmin

  private

  def send_email_notification_to_sysadmin
    sysadmin_user = User.find_by_role_id(Role.find_by_name('sysadmin').id)
    SystemMailer.generic_email(sysadmin_user.email, 'New Feedback/Support message', @feedback_support.inspect).deliver
  end

end
