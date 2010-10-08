class Capybara::XPath
  class << self
    def wavelineup_selector_cell(selector_text)
      # append("//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]")
      
      append("//*[( contains(concat(' ',normalize-space(@class),' '),' selector_cell ') or contains(concat(' ',normalize-space(@class),' '),' selector_cell_nav ') ) and text()=#{s(selector_text)}]")
      # 
      # 
      # append("//*[(@class='selector_cell' or @class='selector_cell_nav') and text()=#{s(selector_text)}]")
    end
  end
end

When 'I click "$text" within a selector cell' do |text|
  msg = "No selector_cell found with the content of ''#{text}'"  
  locate(:xpath, Capybara::XPath.wavelineup_selector_cell(text)).click

# trying to get this to work... not sure where to place Capybara::Selector.add
  # Capybara::Selector.add(:wavelineup_selector_cell) { |selector_text| "//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]" }
  # find(:wavelineup_selector_cell, text).click
end

Then 'I should see "$text" within a selector cell' do |text|
  msg = "No selector_cell found with the content of ''#{text}'"  
  assert locate(:xpath, Capybara::XPath.wavelineup_selector_cell(text)).visible?
 
  # Capybara::Selector.add(:wavelineup_selector_cell) { |selector_text| "//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]" }
  # assert find(:wavelineup_selector_cell, text)
end

Then 'I should not see "$text" within a selector cell' do |text|
  msg = "No selector_cell found with the content of ''#{text}'"  
  assert !locate(:xpath, Capybara::XPath.wavelineup_selector_cell(text)).visible?
end