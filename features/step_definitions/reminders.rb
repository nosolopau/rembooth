Then(/^I get the reminders section$/) do
  expect(page).to have_content 'Reminders'
end

Then(/^I get a list with my (\d+) my task lists$/) do |count|
  expect(page.all('table tbody tr').count).to eq count.to_i
end