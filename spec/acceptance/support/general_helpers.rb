def current_page_is?(page_name)
  current_path = URI.parse(current_url).path
  current_path =~ /page_name/
end

def has_text?(text, selector='*')
  page.has_xpath?("//#{selector}[text()='#{text}']", :visible => true)
end

def tell_brower_to_auto_accept_delete
  page.evaluate_script('window.confirm = function() { return true; }')
end