class UpdateStatusJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Project.update_status
  end
end
