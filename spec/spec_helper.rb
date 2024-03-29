# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/core'
require 'rspec/matchers'
require 'ruby-debug'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # flag for wip specs
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end

def login_user(user_factory, options = {})
  # could create a practice outside of this and assign it in to this user by practice_id in the options hash,
  # but if does not exist then we create a practice for this user
  if user_factory != "sysadmin_user" # sysadmin does not have a practice
    if !options[:practice_id]
      practice = Practice.find_by_name("Practice One") # assign if already exists
      practice = Factory.create(:practice_one) if !practice
      options[:practice_id] = practice.id
    end
  end

  @logged_in_user = Factory.create(user_factory, options)
  session[:current_user_id] = @logged_in_user.id
  @logged_in_user
end

def logout_user
  @logged_in_user = nil
  @controller.stub!(:current_user).and_return(@logged_in_user)
  @logged_in_user
end

RSpec.configure do |config|
  config.after(:each) { SystemError.all.each {|error| puts "**SYSTEM ERROR**: #{error.inspect}"}; SystemError.delete_all }
end
