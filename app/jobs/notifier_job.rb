class NotifierJob < ActiveJob::Base
  queue_as :default

  def perform(reminder, redbooth_task)
    Rails.logger.info "Sending notification for Redbooth task #{redbooth_task.id}..."
    TwitterNotification.deliver_for(reminder, redbooth_task)
  end
end
