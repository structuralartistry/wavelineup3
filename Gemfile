source 'http://rubygems.org'

gem 'rails', '3.0.3'

gem 'pg'

# gem 'authlogic'
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'  # standard authlogic broken

gem 'yui-compressor'
gem 'jammit'

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
end
