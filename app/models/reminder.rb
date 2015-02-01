class Reminder
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :notifications
  belongs_to :user

  field :task_list_id, type: String

  validates :task_list_id, uniqueness: true

  def redbooth_tasks
    @redbooth_tasks ||= RedboothService::Task.new(user).find_by(task_list_id: task_list_id).all
  end

  def send_notifications
    redbooth_tasks.each do |redbooth_task|
      notify(redbooth_task) if self.class.due?(redbooth_task)
    end
  end

  def notify(redbooth_task)
    Notification.deliver_for(self, redbooth_task)
  end

  def self.due?(redbooth_task)
    redbooth_task.due_on && Date.parse(redbooth_task.due_on).today?
  end
end
