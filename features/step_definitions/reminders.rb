Then(/^I get the reminders section$/) do
  expect(page).to have_content 'Reminders'
end

Then(/^I get a list with my (\d+) my task lists$/) do |count|
  expect(page.all('table tbody tr').count).to eq count.to_i
end

When(/^I create a new reminder for a task list$/) do
  page.driver.post(toggle_reminders_path, {reminder: {task_list_id: '2768599'}})
  expect(page.status_code).to eq 201
end

When(/^a new reminder has been created for the given task list$/) do
  step 'I navigate to "reminders"'

  expect(has_checked_field?('task_list_2768599')).to eq true
  expect(has_no_checked_field?('task_list_2770927')).to eq true
  expect(has_no_checked_field?('task_list_2778138')).to eq true
end

Given(/^I have a reminder configured$/) do
  step 'I navigate to "reminders"'
  step 'I create a new reminder for a task list'
  step 'a new reminder has been created for the given task list'
end

When(/^I remove the configured reminder$/) do
  page.driver.post(toggle_reminders_path, {reminder: {task_list_id: '2768599'}})
  expect(page.status_code).to eq 200
end

Then(/^I have no reminders configured$/) do
  step 'I navigate to "reminders"'

  expect(has_no_checked_field?('task_list_2768599')).to eq true
  expect(has_no_checked_field?('task_list_2770927')).to eq true
  expect(has_no_checked_field?('task_list_2778138')).to eq true
end

Then(/^no notifications are sent$/) do
  expect(FakeWeb.last_request.path).not_to eq '/1.1/statuses/update.json'
end

Then(/^a notification is sent$/) do
  expect(FakeWeb.last_request.path).to eq '/1.1/statuses/update.json'
end