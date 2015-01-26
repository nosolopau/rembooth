module RedboothService
  class Task < RedboothService::Base
    def open
      fetch_resources(status: 'open')
    end

    def fetch(options = {})
      client.task(:index, options)
    end
  end
end