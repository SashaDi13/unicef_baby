class SendSlackNotificationJob < ApplicationJob
  queue_as :default

  def perform(article_id)
    notifier = Slack::Notifier.new ENV['WEBHOOK_URL'], username: ENV['NAME'],
                                                       channel: ENV['CHANNEL'],
                                                       icon_emoji: ":page_facing_up:"
    @article = Article.find(article_id)

    notifier.ping "Нова стаття була створена. <a href='http://127.0.0.1:3000/advises/#{@article.category_id}/articles/#{article_id}'> Перегляньте її</a>"
  end
end
