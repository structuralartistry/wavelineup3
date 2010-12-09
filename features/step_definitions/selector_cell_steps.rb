When /^I click "([^\"]*)" within a selector cell$/ do |text|
  msg = "No selector_cell found with the content of '#{text}'"  
  page.find(:xpath,"//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()='#{(text)}']", :visible => true).click
end

When /^I click the selector cell "([^\"]*)"$/ do |id|
  msg = "No selector_cell found with the content of '#{id}'"  
  page.find(:xpath,"//*[@id='#{id}' and ( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') )]", :visible => true).click
end

Then /^I should see "([^\"]*)" within a selector cell$/ do |text|
  msg = "No selector_cell found with the content of '#{text}'"  
  assert page.find(:xpath,"//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()='#{(text)}']", :visible => true)
end

# locates by id
Then /^I should see "([^\"]*)" within the "([^\"]*)" selector cell$/ do |text, id|
  msg = "No selector_cell found with the content of '#{text}' and id of #{id}"  
  assert page.find(:xpath,"//*[@id='#{id}' and ( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()='#{(text)}']", :visible => true)
end

Then /^I should not see "([^\"]*)" within a selector cell$/ do |text|
  pending # NOTE: change element found code to: page.has_xpath? and page.has_no_xpath?
  msg = "No selector_cell found with the content of '#{text}'" 
  element_found = nil
  begin
    # this fails fatally if element does not exist
    element_found = page.find(:xpath,"//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()='#{(text)}']", :visible => true)
  rescue
  end
  
  # element could be found but not visible - we only care about visible elements
  if element_found
    assert !element_found.visible?
  else
    assert !element_found
  end
end

Then /^I should see the selector cell "([^\"]*)" as selected$/ do |selector_cell_text|
  msg = "No selector_cell found with the content of '#{selector_cell_text}'"  
  assert page.find(:xpath,"//*[
    ( 
      contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or 
      contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') 
    ) and
    (
      contains(concat(' ',normalize-space(@class),' '),' current_selected ')
    ) 
    and text()='#{(selector_cell_text)}']", :visible => true)
end

Then /^I should see the selector cell "([^\"]*)" as not selected$/ do |selector_cell_text|
  msg = "No selector_cell found with the content of '#{selector_cell_text}'"  
  assert !page.find(:xpath,"//*[
    ( 
      contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or 
      contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') 
    ) and
    (
      contains(concat(' ',normalize-space(@class),' '),' current_selected ')
    ) 
    and text()='#{(selector_cell_text)}']", :visible => true)
end





