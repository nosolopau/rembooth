When(/^I navigate to "([^"]*)"$/) do |section|
 visit "/#{section}"
end

Given(/^I am logged in$/) do
 step 'I navigate to "reminders"'
 step 'I sign in using my Redbooth account'
end

Then(/^I am asked to link my account$/) do
 expect(page).to have_content 'Link Twitter account!'
end

Then(/^My Twitter account is linked$/) do
 expect(page).not_to have_content 'Link Twitter account!'

end