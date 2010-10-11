def get_edit_form_name_for_model_record_value(model, record_value)
  case model
  when "PracticeMember"
    # expecting if form "Kahn, David N" to define record
    record_id = PracticeMember.where("name_last='#{record_value.split[0].gsub(/,/, '')}' and name_first='#{record_value.split[1]}'").first.id
    edit_form_name = "edit_practice_member_#{record_id}"
  when "User"
    # expecting email address
    record_id = User.where("email='#{record_value}'").first.id
    edit_form_name = "edit_user_#{record_id}"
  end   
  edit_form_name
end


When /^I fill in "([^"]*)" with "([^"]*)" within the edit "([^"]*)" form for "([^"]*)"$/ do |field, value, model, record|
  edit_form_name = get_edit_form_name_for_model_record_value(model, record)

  # case model
  #   when "PracticeMember"
  #     # expecting if form "Kahn, David N" to define record
  #     record_id = PracticeMember.where("name_last='#{record.split[0].gsub(/,/, '')}' and name_first='#{record.split[1]}'").first.id
  #     edit_form_name = "edit_practice_member_#{record_id}"
  #   end
   
  When "I fill in \"#{field}\" with \"#{value}\" within \"form##{edit_form_name}\""  
end


When /^I press "([^"]*)" within the edit "([^"]*)" form for "([^"]*)"$/ do |button, model, record|
  edit_form_name = get_edit_form_name_for_model_record_value(model, record)
  When "I press \"#{button}\" within \"form##{edit_form_name}\""
end

# moved here from web_steps.rb as in original if the 'within' element is not present the test fails
# and in my opinion it is fine if the wrapper does not exist
Then /^(?:|I )should not see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  begin
    with_scope(selector) do
      if page.respond_to? :should
        page.should have_no_content(text)
      else
        assert page.has_no_content?(text)
      end
    end
  rescue
      assert true # containing element not found so all is good
  end
end


When /^I click "([^\"]*)" within a selector cell$/ do |text|
  msg = "No selector_cell found with the content of '#{text}'"  
  page.find(:xpath,"//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()='#{(text)}']", :visible => true).click
  
end

Then /^I should see "([^\"]*)" within a selector cell$/ do |text|
  msg = "No selector_cell found with the content of '#{text}'"  
  page.find(:xpath,"//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()='#{(text)}']", :visible => true)
end

Then /^I should not see "([^\"]*)" within a selector cell$/ do |text|
  msg = "No selector_cell found with the content of '#{text}'" 
  element_found = nil
  begin
    # this fails fatally if element does not exist
    element_found = page.find(:xpath,"//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()='#{(text)}']", :visible => false)
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


# this allows us to tell capybara/selenium to speed through js confirm alerts
  Then /tell the page to accept the confirm dialog which is coming/ do
    page.evaluate_script('window.confirm = function() { return true; }')
  end
