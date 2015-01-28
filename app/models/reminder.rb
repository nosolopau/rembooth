class Reminder
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :task_list_id, type: String

  validates :task_list_id, uniqueness: true

  def redbooth_tasks
    RedboothService::Task.new(user).find_by(task_list_id: task_list_id)
  end

  def text_for(task)
    "@#{user.twitter_nickname} #{task.name} - #{task.description}".truncate(140)
  end
end
