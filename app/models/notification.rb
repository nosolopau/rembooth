class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :reminder

  field :redbooth_task_id, type: String
  field :redbooth_task_name, type: String
  field :redbooth_task_description, type: String
  field :redbooth_task_due_on, type: String

  validates :redbooth_task_id, uniqueness: true
  validates :redbooth_task_name, uniqueness: true
  validates :redbooth_task_description, uniqueness: true

  def self.deliver_for(reminder, redbooth_task)
    Rails.logger.info "Sending notification for Redbooth task #{redbooth_task.id}..."

    TwitterNotification.deliver_for(reminder, redbooth_task)
  end

  protected

  def self.notification_pending?(redbooth_task)
    where(redbooth_task_id: redbooth_task.id).empty?
  end
end
