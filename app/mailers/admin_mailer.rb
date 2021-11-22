class AdminMailer < ApplicationMailer
  default to: "exemple@dot.net",
          from: 'notification@example.com'

  def article_create_email(article)
    @article = article
    mail(subject: 'Article was created')
  end
end
