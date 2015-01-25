module RedboothService
  class Task < RedboothService::Base
    def all
      get_collection
    end

    def open
      get_collection(status: 'open')
    end

    def get_collection(options = {})
      tasks_collection = client.task(:index, options)
      tasks = tasks_collection.all

      while tasks_collection = tasks_collection.next_page do
        tasks << tasks_collection.all
      end

      tasks
    end
  end
end