class CancelJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.debug "cancel job " * 10
    Rails.logger.debug "#{self} STARTED " * 10
    return
    raise StandardError
    Rails.logger.debug "END " * 10
    Rails.logger.debug "cancel job " * 10
  end
end

