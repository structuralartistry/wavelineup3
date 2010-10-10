# these are custom selectors for my misguided purposes
class Capybara::XPath
  class << self 
    def wavelineup_selector_cell(selector_text)      
      append("//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()=#{s(selector_text)}]")
      # append("//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]")
      # append("//*[(@class='selector_cell' or @class='selector_cell_nav') and text()=#{s(selector_text)}]")
    end
    
    # def wildcard_form_id(element, text)
    #   append("//form[@id='#{id}']")
    # end
    
    def element(element, text)
      append("//#{element}[text()=#{s(text)}]")
    end  
  end
end


# selector cell steps

  When /^I click "([^\"]*)" within a selector cell$/ do |text|
    msg = "No selector_cell found with the content of ''#{text}'"  
    locate(:xpath, Capybara::XPath.wavelineup_selector_cell(text)).click

  # trying to get this to work... not sure where to place Capybara::Selector.add
    # Capybara::Selector.add(:wavelineup_selector_cell) { |selector_text| "//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]" }
    # find(:wavelineup_selector_cell, text).click
  end

  Then /^I should see "([^\"]*)" within a selector cell$/ do |text|
    msg = "No selector_cell found with the content of ''#{text}'"  
    assert locate(:xpath, Capybara::XPath.wavelineup_selector_cell(text)).visible?
 
    # Capybara::Selector.add(:wavelineup_selector_cell) { |selector_text| "//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]" }
    # assert find(:wavelineup_selector_cell, text)
  end

  Then /^I should not see "([^\"]*)" within a selector cell$/ do |text|
    msg = "No selector_cell found with the content of ''#{text}'" 
    element_found = nil
    begin
      # this fails fatally if element does not exist
      element_found = locate(:xpath, Capybara::XPath.wavelineup_selector_cell(text))
    rescue
    end
    assert !element_found || !element_found.visible?  # should either not be found at all, or if found it should not be visible
  end


# element steps

  # allows us to check not if an element exists, but that it is visible
  # do I need this still?
  Then /^I should not see "([^"]*)" within "([^"]*)" visibly on the page$/ do |text, selector|
    msg = "No element #{selector} found with the content of '#{text}'" 
    element_found = nil
    begin
      # this fails fatally if element does not exist
      element_found = locate(:xpath, Capybara::XPath.element(selector, text))
    rescue
    end
    assert !element_found || !element_found.visible?  # should either not be found at all, or if found it should not be visible
  end


# wildcard form id steps
  # When /^I fill in "([^"]*)" with "([^"]*)" within the form id which starts with "([^"]*)"$/ do |field, value, selector|
  #   scope = locate(:xpath, Capybara::XPath.wildcard_form_id(partial_id))
  #   with_scope(scope) do
  #     fill_in(field, :with => value)
  #   end
  # end




# this allows us to tell capybara/selenium to speed through js confirm alerts
  Then /tell the page to accept the confirm dialog which is coming/ do
    page.evaluate_script('window.confirm = function() { return true; }')
  end















# class Capybara::XPath
#   class << self
#     def element(element, text)
#       append("//#{element}[text()=#{s(text)}]")
#     end
#   end
# end




# class Capybara::XPath
#   class << self
#     def edit_form_element(element, text)
#       append("//#{element}[text()=#{s(text)}]")
#     end
#   end
# end
# When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"(?: within "([^\"]*)")?$/ do |field, value, selector|
#   with_scope(selector) do
#     fill_in(field, :with => value)
#   end
# end



# 
# 
# class Capybara::XPath
#   class << self
#     def wavelineup_selector_cell(selector_text)
#       # append("//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]")
#       
#       append("//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()=#{s(selector_text)}]")
#       # 
#       # 
#       # append("//*[(@class='selector_cell' or @class='selector_cell_nav') and text()=#{s(selector_text)}]")
#     end
#   end
# end
# 
# When /^I click "([^\"]*)" within a selector cell$/ do |text|
#   msg = "No selector_cell found with the content of ''#{text}'"  
#   locate(:xpath, Capybara::XPath.wavelineup_selector_cell(text)).click
# 
# # trying to get this to work... not sure where to place Capybara::Selector.add
#   # Capybara::Selector.add(:wavelineup_selector_cell) { |selector_text| "//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]" }
#   # find(:wavelineup_selector_cell, text).click
# end
# 
# Then /^I should see "([^\"]*)" within a selector cell$/ do |text|
#   msg = "No selector_cell found with the content of ''#{text}'"  
#   assert locate(:xpath, Capybara::XPath.wavelineup_selector_cell(text)).visible?
#  
#   # Capybara::Selector.add(:wavelineup_selector_cell) { |selector_text| "//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]" }
#   # assert find(:wavelineup_selector_cell, text)
# end
# 
# Then /^I should not see "([^\"]*)" within a selector cell$/ do |text|
#   msg = "No selector_cell found with the content of ''#{text}'" 
#   element_found = nil
#   begin
#     # this fails fatally if element does not exist
#     element_found = locate(:xpath, Capybara::XPath.wavelineup_selector_cell(text))
#   rescue
#   end
#   assert !element_found || !element_found.visible?  # should either not be found at all, or if found it should not be visible
# end