Then(/^I must sign in to continue$/) do
  expect(page).to have_content 'Sign in with Redbooth'
end

When(/^I sign in using my Redbooth account$/) do
  click_link 'Sign in with Redbooth'
end
