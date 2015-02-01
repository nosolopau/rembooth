class RemindersController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html

  def index
    @reminders = Reminder.all
    @task_lists = RedboothService::TaskList.new(current_user).all

    respond_with(@reminders)
  end

  def toggle
    @reminder = current_user.reminders.where(reminder_params).first

    if @reminder
      @reminder.destroy

      head :ok
    else
      @reminder = current_user.reminders.new(reminder_params)
      @reminder.save

      head :created
    end
  end

private

  def reminder_params
    params.require(:reminder).permit(:task_list_id)
  end
end
