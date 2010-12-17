def current_page_is?(page_name)
  current_path = URI.parse(current_url).path
  current_path =~ /page_name/
end

def has_text?(text, selector='*')
  page.has_xpath?("//#{selector}[text()='#{text}']")
end
