class Capybara::XPath
  class << self
    def wavelineup_selector_cell(selector_text)
      append("//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]")
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
  assert locate(:xpath, Capybara::XPath.wavelineup_selector_cell(text))
 
  # Capybara::Selector.add(:wavelineup_selector_cell) { |selector_text| "//*[@class='selector_cell_nav' and text()=#{s(selector_text)}]" }
  # assert find(:wavelineup_selector_cell, text)
end





# When 'I click "$locator"' do |locator|
#   msg = "No element found with the content of '#{locator}'"
#   locate(:xpath, Capybara::XPath.element(locator), msg).click
# end
# 
# 
# 
# //div[contains(concat(' ',normalize-space(@class),' '),' foo ')]
# 
# "//ul[@class='error_messages']/li"
# 
# "//#{element}[contains(concat(' ',normalize-space(@class),' '),' foo ')]"
# 
# 
# 
# class Capybara::XPath
#   class << self
#     
#     def selector_cell()
#     
#     def element(locator)
#       append("//*[normalize-space(text())=#{s(locator)}]")
#     end
#   end
# end
# 
# 
# def link(locator)
#   xpath = append("//a[@href][@id=#{s(locator)} or contains(.,#{s(locator)}) or contains(@title,#{s(locator)}) or img[contains(@alt,#{s(locator)})]]")
#   xpath.prepend("//a[@href][text()=#{s(locator)} or @title=#{s(locator)} or img[@alt=#{s(locator)}]]")
# end