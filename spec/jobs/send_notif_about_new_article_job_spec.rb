require 'rails_helper'

RSpec.describe SendNotifAboutNewArticleJob, type: :job do
  describe "#perform" do
    let(:admin) { "exemple@dot.net" }
    let(:category) { 1 }
    let(:article) { create(:article, category_id: category,
                                     published_at: Time.zone.now - 10.minutes) }

    it "SendNotifAboutNewArticleJob" do
      allow(Admin).to receive(:find).and_return(admin)
      allow(AdminMailer).to receive_message_chain(:article_create_email, :deliver_now)

      described_class.new.perform(article)

      expect(AdminMailer).to have_received(:article_create_email)
    end
  end
end
