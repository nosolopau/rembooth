When(/^I navigate to "([^"]*)"$/) do |section|
 visit "/#{section}"
end

Given(/^I am logged in$/) do
 step 'I navigate to "reminders"'
 step 'I sign in using my Redbooth account'
end

When(/^the cron rake task is executed$/) do
 Notifier.run
end