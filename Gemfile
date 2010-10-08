source 'http://rubygems.org'

gem 'rails', '3.0.0'

gem 'pg'

# gem 'authlogic'
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'  # standard authlogic broken

$heroku = ENV['USER'] ? !! ENV['USER'].match(/^repo\d+/) : ENV.any?{|key, _| key.match(/^HEROKU_/)}
unless $heroku
  group :development, :test do
    gem 'ruby-debug19'
    gem 'cucumber-rails'
    gem 'cucumber', '>=0.8.5'
    gem 'capybara'
    gem 'rspec-rails', '>=2.0.0.beta.20'
    gem 'factory_girl_rails'
    gem 'webrat', '>=0.4.3'
    gem 'heroku'
    gem 'database_cleaner'
  end
end
