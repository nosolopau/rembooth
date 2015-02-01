class TwitterNotification < Notification
  field :status, type: String
  field :status_id, type: String

  validates :status, uniqueness: true
  validates :status_id, uniqueness: true

  def self.deliver_for(reminder, redbooth_task)
    twitter_notification = new(
        reminder: reminder,
        redbooth_task_id: redbooth_task.id,
        redbooth_task_name: redbooth_task.name,
        redbooth_task_description: redbooth_task.description,
        redbooth_task_due_on: redbooth_task.due_on
    )

    twitter_notification.compose_status

    Rails.logger.info "Ready notification for #{redbooth_task.id}"

    if reminder.user.linked_twitter_account? && notification_pending?(redbooth_task)
      twitter_notification.deliver!
    end
  end

  def deliver!
    new_status = TwitterService::Base.tweet(status)

    Rails.logger.info "Delivered notification with status id #{new_status.id}!"

    update_attribute(:status_id, new_status.id)
  end

  def compose_status
    self.status = "@#{reminder.user.twitter_nickname} #{redbooth_task_name} (due on #{redbooth_task_due_on}) #{"- #{redbooth_task_description}" if redbooth_task_description}".truncate(140)
  end
end
