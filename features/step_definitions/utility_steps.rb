# this allows us to tell capybara/selenium to speed through js confirm alerts
  Then /tell the page to accept the confirm dialog which is coming/ do
    page.evaluate_script('window.confirm = function() { return true; }')
  end