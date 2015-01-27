class TasksObserver
  def self.run
    Reminder.all.each do |reminder|
      reminder.redbooth_tasks.all.each do |task|
        puts task.id
        TwitterService::Base.new.update()
      end
    end
  end
end