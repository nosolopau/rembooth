class TasksObserver
  def self.run
    Reminder.all.each do |reminder|
      #reminder.redbooth_tasks.all.each do |task|
        reminder.send_notifications
      #end
    end
  end
end