class TasksObserver
  def self.run
    Reminder.all.each do |reminder|
      reminder.redbooth_tasks.all.each do |task|
        text = "@#{reminder.user.twitter_user} #{task.name} - #{task.description}".truncate(140)
        TwitterService::Base.tweet(text)
      end
    end
  end
end