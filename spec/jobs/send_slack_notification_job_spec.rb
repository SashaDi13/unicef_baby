require 'rails_helper'

RSpec.describe SendSlackNotificationJob, type: :job do
  describe "#perform" do
    include Rails.application.routes.url_helpers

    let(:category) { create(:category) }
    let(:article) { create(:article, category: category) }

    let(:notifier) { Slack::Notifier.new ENV['WEBHOOK_URL'], username: ENV['NAME'],
                                                             channel: ENV['CHANNEL'],
                                                             icon_emoji: ":page_facing_up:" }

    before { allow(Slack::Notifier).to receive(:new) }

    it "send notifier to slack" do
      ActiveJob::Base.queue_adapter = :test

      expect(notifier).to receive(:ping).with("Нова стаття була створена. <a href='http://127.0.0.1:3000/advises/#{article.category_id}/articles/#{article.id}'> Перегляньте її</a>")

      described_class.new.perform(article.id)
    end
  end
end
