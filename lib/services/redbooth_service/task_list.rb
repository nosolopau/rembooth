module RedboothService
  class TaskList < RedboothService::Base
    def find_by(options = {})
      client.task_list(:index, options)
    end
  end
end