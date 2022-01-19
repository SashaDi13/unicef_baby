class SendSlackNotificationJob < ApplicationJob
  queue_as :default
  include Rails.application.routes.url_helpers

  def perform(article)
    notifier = Slack::Notifier.new ENV['WEBHOOK_URL'], username: ENV['NAME'],
                                                       channel: ENV['CHANNEL'],
                                                       icon_emoji: ":page_facing_up:"
    @article = Article.find_by(id: article)
    notifier.ping "Нова стаття була створена. <a href='#{category_article_url(@article.category, article)}'> Перегляньте її</a>"
  end
end
