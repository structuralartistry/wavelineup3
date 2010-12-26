# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Wavelineup3::Application.initialize!

# Set up email server
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address  => "mail.structuralartistry.com",
  :port  => 26,
  :authentication => :login,
  :user_name  => "wavelineup+structuralartistry.com",
  :password  => "468111",
  :enable_starttls_auto => false
}

RESTRICTED_PAGE_NOTICE = "This page is not permitted per your access rights"
LOGIN_NOTICE = "Please log in"

APP_URL = 'https://wavelineup.heroku.com'


