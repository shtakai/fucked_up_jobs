class NewsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.debug "-|- " * 10
    Rails.logger.debug "#{self} STARTED " * 10
    DeadJob.perform_later
    News.create(title: Time.now)
    Rails.logger.debug "END " * 10
  end
end

