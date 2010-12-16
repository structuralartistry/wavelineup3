
def selector_cell_is_present?(selector_cell_text)
  page.has_xpath?("//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()='#{(selector_cell_text)}'] | //input[@value='#{(selector_cell_text)}']", :visible => true)
end

def click_selector_cell(selector_cell_text)
  page.find(:xpath, "//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()='#{(selector_cell_text)}'] | //input[@value='#{(selector_cell_text)}']", :visible => true).click
end
