namespace :reminder_notifier do
  desc 'Send the reminders'
  task run: :environment do
    ReminderNotifier.run
  end

end
