require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase

  def test_login_form_loads
    get :new
    assert :success
    assert_tag :tag => 'input', :attributes => { :id => 'user_session_login'}
    assert_tag :tag => 'input', :attributes => { :id => 'user_session_password', :type => 'password' }
    assert_tag :tag => 'input', :attributes => { :value => 'Login' }
  end

  def test_login_and_logout_successful
    user = Factory.create(:user)
    post :create, { :user_session => { :login => user.login, :password => user.password } }
    assert :success
    assert_equal flash[:notice], 'Successfully logged in'
    
    
    
    delete :destroy, :id => 0
    assert_equal flash[:notice], 'Successfully logged out'
  end
  
  def test_login_failed
    
  end



end
