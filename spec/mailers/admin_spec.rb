require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe 'article_create_email' do
    let(:mail) { AdminMailer.article_create_email(article) }
    let(:category) { create(:category) }
    let(:article) { create(:article, category_id: category.id,
                                     published_at: Time.zone.now - 10.minutes) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Article was created')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql(["exemple@dot.net"])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['notification@example.com'])
    end

    it 'assigns @article' do
      expect(mail.body.encoded).to have_content(article.title)
    end
  end
end
