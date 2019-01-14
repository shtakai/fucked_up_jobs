class DeadJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def perform(*args)
    Rails.logger.debug "p-q " * 10
    Rails.logger.debug "#{self} STARTED " * 10
    return
    fail StandardError, 'FUCKOFF'
    Rails.logger.debug "END " * 10
  end
end

