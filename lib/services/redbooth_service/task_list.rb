module RedboothService
  class TaskList < RedboothService::Base
    def fetch(options = {})
      client.task_list(:index, options)
    end
  end
end