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

  Scenario: The system will not send notifications for my reminders if I do not have linked my Twitter account
    Given I am logged in
    Given I have a reminder configured
    When the cron rake task is executed
    Then no notifications are sent

  Scenario: The system will send notifications for my reminders
    Given I am logged in
    Given I have a reminder configured
    Given I have a Twitter account linked
    When the cron rake task is executed
    Then a notification is sent