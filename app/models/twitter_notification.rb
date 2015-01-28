class TwitterNotification < Notification
  field :status_id, type: String
  field :status, type: String

  def self.deliver_for(reminder, redbooth_task)
    twitter_notification = new(
        reminder: reminder,
        redbooth_task_id: redbooth_task.id,
        redbooth_task_name: redbooth_task.name,
        redbooth_task_description: redbooth_task.description
    )

    twitter_notification.compose_status

    unless already_notified?(redbooth_task)
      twitter_notification.save if twitter_notification.deliver!
    end
  end

  def deliver!
    new_status = TwitterService::Base.tweet(status)
    self.status_id = new_status.id

    new_status
  end

  def user_twitter_nickname
    reminder.user.twitter_nickname
  end

  def compose_status
    self.status = "@#{user_twitter_nickname} #{redbooth_task_name} #{"- #{redbooth_task_description}" if redbooth_task_description}".truncate(140)
  end
end
