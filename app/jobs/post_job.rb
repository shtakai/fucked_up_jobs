class PostJob < ApplicationJob
  PostError = Class.new(StandardError)
  XPostError = Class.new(StandardError)

  queue_as :default

  rescue_from ActiveRecord::RecordNotFound do
    retry_job wait: 1.second
  end

  def perform(*args)
    Rails.logger.debug "-=- " * 10
    Rails.logger.debug "STARTED " * 10
    fail XPostError, 'test'
    Rails.logger.debug "END " * 10
  end
end
