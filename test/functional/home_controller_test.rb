require 'test_helper'

class HomeControllerTest < ActionController::TestCase
    
  def test_page_loads
    get :index
    assert_response :success
    assert_tag :tag => 'h1', :content => "Hello World"
  end
  
  def test_application_layout
    get :index
    assert_tag :tag => 'div', :attributes => { :id => 'container' }
    assert_tag :tag => 'div', :attributes => { :id => 'user_nav' }
    assert_tag :tag => 'a', :content => 'Register'
  end

end
