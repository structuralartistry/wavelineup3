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





# class Capybara::XPath
#   class << self
#     def element(element, text)
#       append("//#{element}[text()=#{s(text)}]")
#     end
#   end
# end
# Then /^I should not see "([^"]*)" within "([^"]*)" visibly on the page$/ do |text, selector|
#   msg = "No element #{selector} found with the content of '#{text}'" 
#   element_found = nil
#   begin
#     # this fails fatally if element does not exist
#     element_found = locate(:xpath, Capybara::XPath.element(selector, text))
#   rescue
#   end
#   assert !element_found || !element_found.visible?  # should either not be found at all, or if found it should not be visible
# end
# 
# 
# 
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
# 
# 
# 
# Then /tell the page to accept the confirm dialog which is coming/ do
#   page.evaluate_script('window.confirm = function() { return true; }')
# end
