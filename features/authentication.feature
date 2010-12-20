Feature: Log in and log out
  In order to protect secure information
  As an authorized user
  I want to be able to log in to the system
  And I want to be able to log out of the system
  
  
  Scenario: I can get to the login page
    Given I am not logged in
    When I go to the login page
		Then I should see the login fields
    
    
  Scenario: When I am logged in and I go to the login page I am redirected to the home page
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    When I go to the login page
    And I should see "Logout" within a selector cell
    
	@javascript
  Scenario: When I am logged in and I click the logout link I am sent to the login page
    Given I am logged in in a "practice user" user role for the practice "Demo Practice"
    When I click "Logout" within a selector cell
    Then I should see "Successfully logged out"
    Then I should see the login fields
        
  
  # log in scenarios
    Scenario: Authentication succeeds when good information provided
      Given there are no registered practices or users
      Given I am on the login page
      Given I am a registered and activated "practice" user with the email "practice@structuralartistry.com"
			When I login with email "practice@structuralartistry.com" and password "Password1"
      Then I should see "practice@structuralartistry.com" within a selector cell
  
  
    Scenario: Authentication fails when no login info
      Given I am not logged in
      Given I am on the login page
      When I press "Submit"
      Then I should see "Authentication failed"
    
    
    Scenario: Authentication fails when no email
      Given I am not logged in
      Given I am on the login page
      When I press "Submit"
      Then I should see "Authentication failed"
    
    
    Scenario: Authentication fails when no password
      Given I am not logged in
      Given I am on the login page
      When I press "Submit"
      Then I should see "Authentication failed"
  
  