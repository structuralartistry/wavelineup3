source 'http://rubygems.org'

gem 'rails', '3.0.7'

gem 'pg'

# gem 'authlogic'
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'  # standard authlogic broken

gem 'validates_timeliness', '~> 3.0.2'

gem 'yui-compressor'
gem 'uglifier'
gem 'jammit'

gem 'recaptcha', :require => 'recaptcha/rails'

# this needs to be set at heroku
# heroku config:add BUNDLE_WITHOUT='development test'

group :development, :test do
  gem 'ruby-debug19'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'heroku'
  gem 'database_cleaner'
	gem 'shoulda'
	gem 'steak'	
	gem 'sqlite3-ruby', '1.2.5'
	gem 'taps'
  gem 'escape_utils' # to get rid of error: /usr/local/rvm/gems/ruby-1.9.2-p136@ncc_billing/gems/rack-1.2.3/lib/rack/utils.rb:16: warning: regexp match /.../n against to UTF-8 string
end
