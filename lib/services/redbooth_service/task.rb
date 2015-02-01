module RedboothService
  class Task < RedboothService::Base
    def find_by(options = {})
      client.task(:index, options)
    end
  end
end