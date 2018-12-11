class NewsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def perform(*args)
    Rails.logger.debug "-|- " * 10
    Rails.logger.debug "#{self} STARTED " * 10
    News.create(title: Time.now)
    DeadJob.perform_later
    Rails.logger.debug "END " * 10
  end
end

