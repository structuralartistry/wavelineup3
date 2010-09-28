Feature: User registration


  Scenario: A practitioner can register their practice and create their user in the system
    Given there are no registered practices or users
    Given I am not logged in
    Given I am on the home page
    
    # create the practice
    When I follow "Create My Practice"
    Then I should see "Create Practice" within "h1"
    And I should see "Practice name" within "label"
    And I should see "Create your login"
    And I should see "You will be able to create more users for your practice once your registration is complete."
    And I should see "Email" within "label"
    And I should see "Password" within "label"
    And I should see "Password confirmation" within "label"
    When I fill in "practice_name" with "Practice One"
    And I fill in "practice_users_attributes_0_email" with "practice@structuralartistry.com"
    And I fill in "practice_users_attributes_0_password" with "password1"
    And I fill in "practice_users_attributes_0_password_confirmation" with "password1"
    When I press "Submit"
    Then I should see "Practice was successfully created. Please check your email for the activation link."
    
    # activate primary user for the new practice
    Given I check my email "practice@structuralartistry.com" and activate my user
    
    # verify success
    Then I should see "Practice One" within "a"
    And I should see "practice@structuralartistry.com" within "a"
    When I follow "Practice One"
    Then I should see "Manage Practice"
    And I should see "practice@structuralartistry.com" within "td"
    And I should see "practice admin" within "td"
    And I should not see "Email" within "label"
    And I should not see "Password" within "label"
    And I should not see "Password confirmation" within "label"
    
    
  Scenario: A practitioner tries to register a practice with a name which already exists
    Given there is a practice in the system named "Practice One"
    Given I am not logged in
    When I go to the new practice page
    When I fill in "practice_name" with "Practice One"
    And I fill in "practice_users_attributes_0_email" with "practice@structuralartistry.com"
    And I fill in "practice_users_attributes_0_password" with "password1"
    And I fill in "practice_users_attributes_0_password_confirmation" with "password1"
    When I press "Submit"
    Then I should see "Practice name has already been taken"
    
