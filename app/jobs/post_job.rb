class PostJob < ApplicationJob
  PostError = Class.new(StandardError)

  queue_as :default

  rescue_from PostError do
    retry_job wait: 1.second
  end

  def perform(*args)
    Rails.logger.debug "-=- " * 10
    fail PostError, 'test'
  end
end
