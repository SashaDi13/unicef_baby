class AdminMailer < ApplicationMailer
  default to: "exemple@dot.net",
          from: 'notification@example.com'

  def article_create_email(article_id)
    attachments.inline['brand.png'] = File.read('app/assets/images/brand.png')
    
    @article = Article.find(article_id)
    make_bootstrap_mail(subject: 'Article was created')
  end
end
