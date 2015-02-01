When(/^I link my Twitter account$/) do
  click_link 'Link Twitter account!'
end

Then(/^I am asked to link my account$/) do
  expect(page).to have_content 'Link Twitter account!'
end

Then(/^my Twitter account is linked$/) do
  expect(page).not_to have_content 'Link Twitter account!'
end

Given(/^I have a Twitter account linked$/) do
  step 'I link my Twitter account'
  step 'my Twitter account is linked'
end