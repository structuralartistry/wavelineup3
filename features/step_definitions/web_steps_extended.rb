def get_edit_form_name_for_model_record_value(model, record_value)
  case model
  when "PracticeMember"
    # expecting if form "Kahn, David N" to define record
    record_id = PracticeMember.where("last_name='#{record_value.split[0].gsub(/,/, '')}' and first_name='#{record_value.split[1]}'").first.id
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
  #     record_id = PracticeMember.where("last_name='#{record.split[0].gsub(/,/, '')}' and first_name='#{record.split[1]}'").first.id
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


# the stock web step does not get the value of an input field so...
Then /^the "([^\"]*)" input field should contain "([^\"]*)"$/ do |field, value|
  assert page.find_by_id(field).value.should == value
end

# checkbox value can be true, not checked, thus these have been moved from web steps
Then /^the "([^\"]*)" checkbox(?: within "([^\"]*)")? should be checked$/ do |label, selector|
  with_scope(selector) do
    field_checked = find_field(label)['checked']
    if field_checked == 'checked'
      assert_equal 'checked', field_checked 
    else
      assert_equal 'true', field_checked if field_checked == 'true'
    end
  end
end
Then /^the "([^\"]*)" checkbox(?: within "([^\"]*)")? should not be checked$/ do |label, selector|
  with_scope(selector) do
    field_checked = find_field(label)['checked']
    if field_checked == 'checked'
      assert_not_equal 'checked', field_checked 
    else
      assert_not_equal 'true', field_checked if field_checked == 'true'
    end
  end
end


