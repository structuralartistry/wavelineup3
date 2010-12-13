require 'test_helper'

class TryoutTest < ActionDispatch::IntegrationTest
  fixtures :all
  
  def test_this
    # Factory.create(:practice_admin_role)
    # Factory.create(:practice_user_role)
    # practice = Factory.create(:practice, :name => "Random") if !practice
    # user = Factory.create(:practice_user, :email => "practice@structuralartistry.com", :practice_id => practice.id )

    Role.create(:name => 'sysadmin')
    Role.create(:name => 'practice admin')
    Role.create(:name => 'practice user')

    practice = Practice.create(:name => "Demo Practice")
    user = User.new
    user.email = 'dk.kahn@gmail.com'
    user.password = 'password1'
    user.password_confirmation = 'password1'
    user.practice_id = practice.id
    user.role_id = Role.find_by_name('practice admin').id
    user.active = true
    user.save


    # how to tell Rails to use the test environment -- how to tell Capybara to spin up a webserver with test environment to hit
    
    visit "/login"
    fill_in('Email', :with => user.email)
    fill_in('Password', :with => 'password1')
    click_button('Submit')
    assert page.has_content?('Logout')
  end

end

# require 'capybara/rails'
# 
# module ActionController
# 
#   class IntegrationTest
#     include Capybara
# 
#     Capybara.register_driver :selenium_chrome do |app|
#          Capybara::Driver::Selenium.new(app, :browser => :chrome)
#     end
# 
#     Capybara.default_driver = :selenium_chrome
#   end
# 
# end
# 
# 
# 
# 
# 
# require 'capybara'
# require 'capybara/dsl'
# 
# Capybara.default_driver = :selenium
# 
#  
# class GenericTest < ActionController::IntegrationTest
#   include Capybara
#   
#   def test_this   
#     thread = Thread.new { %x[rails server -p 3002 --environment=test] }
#     sleep(5)
#     
#     Factory.create(:practice_admin_role)
#     Factory.create(:practice_user_role)
#     practice = Factory.create(:practice, :name => "Random") if !practice
#     user = Factory.create(:practice_user, :email => "practice@structuralartistry.com", :practice_id => practice.id )
# 
#     # how to tell Rails to use the test environment -- how to tell Capybara to spin up a webserver with test environment to hit
#     
#     visit "http://localhost:3002/login"
#     
#     debugger
#     
#     fill_in('Email', :with => user.email)
#     fill_in('Password', :with => 'password1')
#     click_button('Submit')
#     assert page.has_content?('Logout')
#   end
#   
  # def test_this_again
  #   Factory.create(:practice_admin_role)
  #   Factory.create(:practice_user_role)
  #   practice = Factory.create(:practice, :name => "Random") if !practice
  #   user = Factory.create(:practice_user, :email => "practice@structuralartistry.com", :practice_id => practice.id )
  #  
  #   # how to tell Rails to use the test environment -- how to tell Capybara to spin up a webserver with test environment to hit
  #   
  #   visit "http://localhost:3000/login"
  #   fill_in('Email', :with => user.email)
  #   fill_in('Password', :with => 'password1')
  #   click_button('Submit')
  #   assert page.has_content?('Logout')
  # 
  # end
  
  # fixtures :users
  #  
  # test "login and browse site" do
  #   # login via https
  #   https!
  #   get "/login"
  #   assert_response :success
  #  
  #   post_via_redirect "/login", :username => users(:avs).username, :password => users(:avs).password
  #   assert_equal '/welcome', path
  #   assert_equal 'Welcome avs!', flash[:notice]
  #  
  #   https!(false)
  #   get "/posts/all"
  #   assert_response :success
  #   assert assigns(:products)
  # end
# end