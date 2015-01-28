class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :reminder

  field :redbooth_task_id, type: String
  field :redbooth_task_name, type: String
  field :redbooth_task_description, type: String

  def self.deliver_for(reminder, redbooth_task)
    # Raise!
  end

  protected

  def self.already_notified?(redbooth_task)
    where(redbooth_task_id: redbooth_task.id).any?
  end
end
