class RemindersController < ApplicationController
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  respond_to :html

  def index
    @reminders = Reminder.all
    @task_lists = RedboothService::TaskList.new(current_user).all

    respond_with(@reminders)
  end

  def show
    respond_with(@reminder)
  end

  def new
    @reminder = Reminder.new
    respond_with(@reminder)
  end

  def edit
  end

  def toggle
    @reminder = current_user.reminders.where(reminder_params).first

    if @reminder
      @reminder.destroy
    else
      @reminder = current_user.reminders.new(reminder_params)
      @reminder.save
    end

    respond_with(@reminder)
  end

  def create
    @reminder = current_user.reminders.new(reminder_params)
    @reminder.save

    respond_with(@reminder)
  end

  def update
    @reminder.update(reminder_params)
    respond_with(@reminder)
  end

  def destroy
    @reminder.destroy
    respond_with(@reminder)
  end

  private
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    def reminder_params
      params.require(:reminder).permit(:task_list_id)
    end
end
