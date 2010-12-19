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


# def input_has_text?(text)
#   page.has_xpath?("//input[@value='#{text}']")
#   page.has_xpath?
# end

def tell_brower_to_auto_accept_delete
  page.evaluate_script('window.confirm = function() { return true; }')
end