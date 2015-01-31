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