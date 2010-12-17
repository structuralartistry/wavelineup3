

# 
# 
# @javascript
# Scenario: I can use the Practice Member Selector to select a Practice Member and view their Travel Card
#   When I click "Find" within a selector cell
#   When I click "Travel Card" within a selector cell
#   And I click "Kahn, David N" within a selector cell
#   Then I should see "Kahn, David N" within "h1"
#   
#    
# @javascript
# Scenario: I can click on the "K" alphabet key and only see practice members whose last name starts with "K"
#   When I click "Find" within a selector cell
#   Then I should see "Kahn, David N" within a selector cell
#   Then I should see "Apple, John" within a selector cell
#   When I click "K" within a selector cell
#   Then I should see "Kahn, David N" within a selector cell
#   Then I should not see "Apple, John" within a selector cell