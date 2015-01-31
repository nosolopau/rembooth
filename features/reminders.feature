Feature: Reminders

  Scenario: As a user, I can list the task lists in Redbooth and manage my reminders
    Given I am logged in
    When I navigate to "reminders"
    Then I get a list with my 3 my task lists
