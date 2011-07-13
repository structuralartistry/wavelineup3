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

def selector_cell_xpath_by_id(selector_cell_id)
  return "//*[@id='#{selector_cell_id}' and
    (
      contains(concat(' ',normalize-space(@class),' '),' selector_cell ')
      or
      contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ')
      or
      contains(concat(' ',normalize-space(@class),' '),' selector_cell_submit ')
    )]"
end

def selector_cell_present?(selector_cell_text_or_id)
  return true if page.has_xpath?(selector_cell_xpath(selector_cell_text_or_id), :visible => true)
  # check for the id.... sometimes we want to pass the id in
  page.has_xpath?(selector_cell_xpath_by_id(selector_cell_text_or_id), :visible => true)
end

def click_selector_cell(selector_cell_text_or_id)
  begin
  # we expect either the Text of the selector cell or the Id
  type = is_text_or_id(selector_cell_text_or_id)
  case type
  when 'text'
    page.find(:xpath, selector_cell_xpath(selector_cell_text_or_id), :visible => true).click
  when 'id'
    page.find(:xpath, "//*[@id='#{selector_cell_text_or_id}']", :visible => true).click
  end
  rescue
    # there is an error in a case where it *seems* that Selenium is trying to click the element twice and fails on the second
    # we don't really care as we dont care about a return value and if element to click does not exist we will deal with laster
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

def verify_visit_gateway_selector(id, side_text, gateway_text)
  get_selector_cell_text(id).should == "#{side_text} #{gateway_text}".strip
  if side_text != ''
    page.find(:xpath, "//td[@id='#{id}']/span[@class='gateway_selector_side_highlight_#{side_text.downcase}']").text.should == side_text
  end
end

