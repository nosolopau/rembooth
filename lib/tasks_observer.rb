class TasksObserver
  def self.run
    Reminder.all.each do |reminder|
      reminder.redbooth_tasks.all.each do |task|
        puts task.id
      end
    end
  end
end