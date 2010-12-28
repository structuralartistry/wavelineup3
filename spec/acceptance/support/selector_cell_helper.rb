# general finder method for a selector cell
def selector_cell_xpath(selector_cell_text, selected=nil)
  xpath_selected_clause = "and ( contains(concat(' ',normalize-space(@class),' '),' current_selected ') )" if selected
    
  xpath_selector_cell = "//*[
    ( 
      contains(concat(' ',normalize-space(@class),' '),' selector_cell ') 
      or 
      contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') 
      or 
      contains(concat(' ',normalize-space(@class),' '),' selector_cell_submit ')
    ) 
    #{xpath_selected_clause} 
    and text()='#{(selector_cell_text)}']"
  
  xpath_input_button = "//input[@value='#{(selector_cell_text)}' #{xpath_selected_clause}]"
  
  return xpath_selector_cell + ' | ' + xpath_input_button
end

def selector_cell_present?(selector_cell_text)
  page.has_xpath?(selector_cell_xpath(selector_cell_text), :visible => true)
end

def click_selector_cell(selector_cell_text_or_id)
  # we expect either the Text of the selector cell or the Id
  type = is_text_or_id(selector_cell_text_or_id)
  case type
  when 'text'
    page.find(:xpath, selector_cell_xpath(selector_cell_text_or_id), :visible => true).click
  when 'id'
    page.find(:xpath, "//*[@id='#{selector_cell_text_or_id}']", :visible => true).click
  end
end

def get_selector_cell_text(selector_cell_id)
  page.find(:xpath, "//*[@id='#{selector_cell_id}']").text
end

def is_text_or_id(selector_cell_text_or_id)
  return 'text' if page.has_xpath?(selector_cell_xpath(selector_cell_text_or_id), :visible => true)
  return 'id' if page.has_xpath?("//*[@id='#{selector_cell_text_or_id}']")
  return nil
end

def selector_cell_selected?(selector_cell_text)
  page.has_xpath?(selector_cell_xpath(selector_cell_text, true), :visible => true)
end