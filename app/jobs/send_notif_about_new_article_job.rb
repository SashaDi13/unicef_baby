class SendNotifAboutNewArticleJob < ApplicationJob
  queue_as :default
  def perform(article)
     AdminMailer.article_create_email(article).deliver_now
  end
end
