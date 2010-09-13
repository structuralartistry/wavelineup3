require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  # register a user
    def test_registration_form_loads
      get :new
      assert :success
      assert_tag :tag => 'input', :attributes => { :id => 'user_login'}
      assert_tag :tag => 'input', :attributes => { :id => 'user_email'}
      assert_tag :tag => 'input', :attributes => { :id => 'user_password', :type => 'password' }
      assert_tag :tag => 'input', :attributes => { :id => 'user_password_confirmation', :type => 'password' }
      assert_tag :tag => 'input', :attributes => { :value => 'Submit' }
    end
    
    def test_create_new_user
      user = Factory.build(:user)
      post :create, { :user => { 
                                  :login => user.login, 
                                  :email => user.email, 
                                  :password => user.password, 
                                  :password_confirmation => user.password }
                    }
      assert :success
      assert_redirected_to root_url
      assert_equal flash[:notice], 'Registration successful'
    end

end
