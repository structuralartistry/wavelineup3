require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase

  def test_session_new_page_load
    get :new  
    assert_response :success 
    
    
    # require 'nokogiri'
    # response_doc = Nokogiri::HTML(response.body)
    
    page = HtmlMatcher.new(response.body)
    
    assert page.has_xpath?("//*")
    
    assert page.has_no_xpath?("//*[text()='xoxoxox']")
    
    confirm_login_page_loaded(page)
    # 
    # assert_not_empty response_doc.xpath("//*")
    # 
    # assert_empty response_doc.xpath("//*[text()='xoxoxox']")
       #  
       # # verify fields
       # assert page.has_xpath?("//h1[text()='Login']")
       # assert page.has_xpath?("//label[text()='Email']")
       # assert page.has_xpath?("//label[text()='Password']") 
       # assert selector_cell_is_present?("Create My Practice")
       # assert page.has_no_content?("Logout")
       # assert page.has_no_xpath?("//td[(@class='selector_cell_nav') and (text()='Login')]")
       
    
  end
  
    def confirm_login_page_loaded(page)
      # verify fields
      assert page.has_xpath?("//h1[text()='Login']")
      assert page.has_xpath?("//label[text()='Email']")
      assert page.has_xpath?("//label[text()='Password']") 
      # assert selector_cell_is_present?("Create My Practice")
      # assert page.has_no_content?("Logout")
      assert page.has_no_xpath?("//td[(@class='selector_cell_nav') and (text()='Login')]")
    end
  

end


class HtmlMatcher
  require 'nokogiri'
  def initialize(html)
    @response_doc = Nokogiri::HTML(html)
  end
  
  def has_xpath?(xpath)
    return false if @response_doc.xpath(xpath).empty?
    true
  end
  
  def has_no_xpath?(xpath)
    return true if @response_doc.xpath(xpath).empty?
    false
  end  
end