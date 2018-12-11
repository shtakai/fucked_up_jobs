class PostJob < ApplicationJob
  PostError = Class.new(StandardError)
  XPostError = Class.new(StandardError)

  queue_as :default

  rescue_from PostError do
    Rails.logger.debug "0o0 " * 10
    Rails.logger.debug "PostError"
    Rails.logger.debug "0o0 " * 10
    retry_job wait: 10.second
  end

  rescue_from StandardError do
    Rails.logger.debug "Xx_ " * 10
    Rails.logger.debug "StandardError"
    Rails.logger.debug "Xx_ " * 10
    retry_job wait: 10.second
  end

  def perform(*args)
    Rails.logger.debug "-=- " * 10
    Rails.logger.debug "#{self} STARTED " * 10
    Rails.logger.debug "STARTED " * 10
    # error = rand(10) > 5 ? PostError : XPostError
    # fail error, 'test'
    Post.create(title: Time.now)
    NewsJob.perform_later
    Rails.logger.debug "END " * 10
  end
end
