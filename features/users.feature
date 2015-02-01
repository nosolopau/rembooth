Feature: Users account management

  Scenario: As a user, I can link my Twitter account
    Given I am logged in
    When I navigate to "reminders"
    Then I am asked to link my account
    When I link my Twitter account
    Then my Twitter account is linked