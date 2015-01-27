class TasksObserver
  def self.run
    Reminder.all.each do |reminder|
      reminder.redbooth_tasks.all.each do |task|
        TwitterService::Base.mention('nosolopau', task.name)
      end
    end
  end
end