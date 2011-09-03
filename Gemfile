source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'

gem 'validates_timeliness', '~> 3.0.2'
gem 'recaptcha', :require => 'recaptcha/rails'
gem 'kaminari'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# this needs to be set at heroku
# heroku config:add BUNDLE_WITHOUT='development test'
group :development, :test do
  gem 'ruby-debug19', :require => 'ruby-debug'
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'capybara'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
	#gem 'shoulda'
  gem 'shoulda', '>= 3.0.0.beta'
	#gem 'sqlite3-ruby', '1.2.5'
	gem 'taps'
  gem 'escape_utils' # warning: regexp match /.../n against to UTF-8 string
  gem 'steak'
  gem 'heroku'
  gem 'jasmine'
  #gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-coffeescript'
  gem 'guard-livereload'
end
