def current_page_is?(page_name)
  current_path = URI.parse(current_url).path
  current_path =~ /page_name/
end

def has_text?(text, selector='*')
  page.has_xpath?("//#{selector}[text()='#{text}']", :visible => true)
end

def get_element_text(element_id)
  page.find(:xpath, "//*[@id='#{element_id}']").value
end

def get_input_value(input_id)
  page.find(:xpath, "//input[@id='#{input_id}']").value
end

def checked?(checkbox_id)
  return_value = page.find(:xpath, "//input[@id='#{checkbox_id}' and @type='checkbox']")['checked']
  return true if return_value == 'true'
  false
end

def tell_brower_to_auto_accept_delete
  page.evaluate_script('window.confirm = function() { return true; }')
end