namespace :notifier do

  desc 'Send the notifications for the configured reminders'
  task run: :environment do
    puts 'Starting notifier:run...'

    Notifier.run

    puts 'Finished!'
  end
end
