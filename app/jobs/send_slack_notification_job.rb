class SendSlackNotificationJob < ApplicationJob
  queue_as :default
  include Rails.application.routes.url_helpers

  def perform(category, article)
    notifier = Slack::Notifier.new ENV['WEBHOOK_URL'], username: ENV['NAME'],
                                                       channel: ENV['CHANNEL'],
                                                       icon_emoji: ":page_facing_up:"
    notifier.ping "Нова стаття була створена. <a href='#{category_article_url(category, article)}'> Перегляньте її</a>"
  end

  private
    def default_url_options
      Rails.application.config.active_job.default_url_options
    end
end
