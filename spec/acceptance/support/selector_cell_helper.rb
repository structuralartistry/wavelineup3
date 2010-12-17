# general finder method for a selector cell
def selector_cell_xpath(selector_cell_text, selected=nil)
  xpath_basic = "//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()='#{(selector_cell_text)}'] | //input[@value='#{(selector_cell_text)}']"
  xpath_selected_clause = "and ( contains(concat(' ',normalize-space(@class),' '),' current_selected ') )" if selected
  xpath = xpath_basic + ' ' + (xpath_selected_clause || '')
end

def selector_cell_is_present?(selector_cell_text)
  page.has_xpath?(selector_cell_xpath(selector_cell_text), :visible => true)
end

def click_selector_cell(selector_cell_text)
  page.find(:xpath, selector_cell_xpath(selector_cell_text), :visible => true).click
end

def selector_cell_selected?(selector_cell_text)
  page.has_xpath?(selector_cell_xpath(selector_cell_text, true), :visible => true)
end


# 
# Then /^I should see the selector cell "([^\"]*)" as selected$/ do |selector_cell_text|
#   msg = "No selector_cell found with the content of '#{selector_cell_text}'"  
#   assert page.find(:xpath,"//*[
#     ( 
#       contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or 
#       contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') 
#     ) and ( contains(concat(' ',normalize-space(@class),' '),' current_selected ') ) 
#     and text()='#{(selector_cell_text)}']", :visible => true)
# end
# 
# Then /^I should see the selector cell "([^\"]*)" as not selected$/ do |selector_cell_text|
#   msg = "No selector_cell found with the content of '#{selector_cell_text}'"  
#   assert !page.find(:xpath,"//*[
#     ( 
#       contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or 
#       contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') 
#     ) and
#     (
#       contains(concat(' ',normalize-space(@class),' '),' current_selected ')
#     ) 
#     and text()='#{(selector_cell_text)}']", :visible => true)
# end
# 
