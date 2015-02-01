Feature: Reminders

  Scenario: As a user, I can list the task lists in Redbooth and manage my reminders
    Given I am logged in
    When I navigate to "reminders"
    Then I get a list with my 3 my task lists

  Scenario: As a user, I can create a reminder for a task list
    Given I am logged in
    When I navigate to "reminders"
    When I create a new reminder for a task list
    When a new reminder has been created for the given task list

  Scenario: As a user, I can remove a reminder for a task list
    Given I am logged in
    Given I have a reminder configured
    When I remove the configured reminder
    Then I have no reminders configured