class Notifier
  def self.run
    Reminder.all.each do |reminder|
      reminder.send_notifications
    end
  end
end