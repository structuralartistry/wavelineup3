def verify_highlighted?(id)
  page.has_xpath?("//*[@id='#{id}' and contains(concat(' ',normalize-space(@class),' '),' highlighted ')]")
end


