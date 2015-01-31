Feature: User sign in & sign out

Scenario: As a user, I must sign in to use the application
  When I navigate to "reminders"
  Then I must sign in to continue

Scenario: As a user, I can sign in the application using my Redbooth account
  When I navigate to "reminders"
  Then I must sign in to continue
  When I sign in using my Redbooth account
  Then I get the reminders section

