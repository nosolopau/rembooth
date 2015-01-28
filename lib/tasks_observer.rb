class TasksObserver
  def self.run
    Reminder.all.each do |reminder|
      reminder.redbooth_tasks.all.each do |task|
        TwitterService::Base.delay.tweet(reminder.text_for(task))
      end
    end
  end
end