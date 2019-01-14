class NikuJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.debug "-|- " * 10
    Rails.logger.debug "#{self} STARTED " * 10
    ActiveRecord::Base.transaction do
      Rails.logger.debug "TX start"
      news = create_news
      Rails.logger.debug "news: #{news.inspect}"
      post = create_post
      Rails.logger.debug "post: #{post.inspect}"
      # raise StandardError, 'perform error'
      ensure_sushi
      Rails.logger.debug "TX end"
    end
    Rails.logger.debug "END " * 10
  end

  private

  def ensure_sushi
    Rails.logger.debug "SUSHI"
    raise StandardError, 'sushi error'
  end

  def create_news
    news = News.new(title: Time.zone.now)
    news.save
    # raise StandardError, 'news error'
    news
  end

  def create_post
    post = Post.new(title: Time.zone.now)
    post.save
    # raise StandardError, 'post error'
    post
  end
end

