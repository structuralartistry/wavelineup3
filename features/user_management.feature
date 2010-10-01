Feature: User Management
  Creation of users in the system and associated administrative tasks


  Scenario: Add a new user to a practice and activate
    Given I am logged in in a "practice user" user role for the practice "Practice One"
    Given I am on the home page
    
    # get to practice management page
    When I follow "Practice One"
    Then I should see "Practice One"
    And I should see "Users" within "h1"
    And I should see "practice_user@structuralartistry.com"
    And I should see "Manage Practice"
    
    # add a user
    When I follow "New User"
    Then I should see "Email"
    And I should see "Password"
    And I should see "Password confirmation"
    When I fill in "user_email" with "practice1@structuralartistry.com"
    And I fill in "user_password" with "password1"
    And I fill in "user_password_confirmation" with "password1"
    When I press "Submit"
    
    # verify added
    Then I should see "Practice One"
    And I should see "Users" within "h1"
    And I should see "practice1@structuralartistry.com"
    # all users right now aside from the user which creates the practice will be 'practice user'
    # where the original user is 'practice admin'
    And I should see "practice user"
    
    # can not activate new user while initial user is logged in
    Given I check my email "practice1@structuralartistry.com" and activate my user
    Then I should see "You are already logged in to the system. If you are activating a new user please log out first and try again."
    
    # login as new user
    When I follow "Logout"
    Given I check my email "practice1@structuralartistry.com" and activate my user
    Then I should see "Your account has been activated"
    Then I should see "Home Page" within "h1"
    And I should see "Logout" within "a"
    And I should see "practice1@structuralartistry.com" within "a"
    And I should see "Logged in user: practice1@structuralartistry.com" within "p"
    And I should see "Logged in role: practice user" within "p"
    And I should not see "Login"
    
    # can not resubmit activation
    When I follow "Logout"
    Given I check my email "practice1@structuralartistry.com" and activate my user
    Then I should see "This user is already active. You have been logged in to the system."
    
    
  Scenario: Can not activate non-existant user
    Given I try to activate a non-existant user
    Then I should see "User does not exist"
    
# I can't get this to work because for some reason even if I change User#created_at, the user's perishable token still exists
  # Scenario: Can not activate user from link after activation code has expired
  #   Given I am an inactive user with the email "practice@structuralartistry.com"
  #   Given I have an expired activation code for the email address "practice@structuralartistry.com"
  #   When I try to activate my user with email address "practice@structuralartistry.com"
  #   Then I should see "User failed to be activated. We are sending a new activation link"
     
    
  Scenario: An existing user can view and update their profile
    Given I am logged in in a "practice user" user role
    When I go to the user profile page
    Then I should see "Email" within "label"
    Then I should see "Password" within "label"
    Then I should see "Password confirmation" within "label"
    And the "user_email" field should contain "practice_user@structuralartistry.com"
    When I fill in "user_email" with "sasha@gmail.com"
    When I press "Submit"
    
    # verify
    Then I should see "User profile successfully updated"
    And I should see "Home Page"
    When I go to the user profile page
    Then the "user_email" field should contain "sasha@gmail.com"
    
    
  Scenario: I can delete a user from my account
    Given I am logged in in a "practice user" user role for the practice "Practice One"
    
    # get to the practice management page
    When I follow "Practice One"
    
    # destroy the practice user
    When I follow "Destroy" within "tr#practice_user"
    Then I should see "Can not delete the current user"
    
    # create a new user
    When I follow "New User"
    And I fill in "user_email" with "practice1@structuralartistry.com"
    And I fill in "user_password" with "password1"
    And I fill in "user_password_confirmation" with "password1"
    And I press "Submit"
    Then I should see "User was successfully created. Please check your email for the activation link."
    
    # verify can destroy the newly created user
    When I follow "Destroy" within "tr#practice1"
    Then I should see "User successfully deleted"
    
    
    
  
