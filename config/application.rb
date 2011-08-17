require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the default gems, the ones in the
# current environment and also include :assets gems if in development
# or test environments.
Bundler.require *Rails.groups(:assets) if defined?(Bundler)

module Wavelineup3
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)
    config.autoload_paths += %W(#{config.root}/lib/wavelineup)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true
  end
end

Recaptcha.configure do |config|
  config.public_key  = '6LdwxcQSAAAAAKxLvY9sGxF-mebFezkbA9I0ZCoo'
  config.private_key = '6LdwxcQSAAAAALZ6dGPxATGZbGgkJE-noS_Nq1K7'
end

# Set up email server
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address  => "mail.wavelineup.com",
  :port  => 26,
  :authentication => :login,
  :user_name  => "system+wavelineup.com",
  :password  => "468111",
  :enable_starttls_auto => false
}
ActionMailer::Base.default :from => "WaveLineup <system@wavelineup.com>"

RESTRICTED_PAGE_NOTICE = "This page is not permitted per your access rights"
LOGIN_NOTICE = "Please log in"
LINEUP_DURATION_OF_STAY_MINUTES = 30

Time::DATE_FORMATS[:default] = "%Y-%m-%d %H:%M"

STANDARD_TEST_PASSWORD = 'Password1'
BAD_STANDARD_TEST_PASSWORD = 'badPassword1'
