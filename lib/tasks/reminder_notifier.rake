namespace :reminder_notifier do
  desc 'Send the reminders'
  task run: :environment do
    puts 'Stargint reminder_notifier:run...'
    ReminderNotifier.run
    puts 'Finished!'
  end
end
