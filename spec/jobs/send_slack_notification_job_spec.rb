require 'rails_helper'

RSpec.describe SendSlackNotificationJob, type: :job do
  describe "#perform" do
    let(:admin) { "exemple@dot.net" }
    let(:category) { create(:category) }
    let(:article) { create(:article, category_id: category.id,
                                     published_at: Time.zone.now - 10.minutes) }
    let(:text) { Slack::Notifier.new 'http://example.com/webhook', username: 'Max',
                                                                  channel: '#test',
                                                                  icon_emoji: ":page_facing_up:"}

    it "SendSlackNotificationJo" do
      expect(text).to receive(:ping).with("New article")
    end
  end
end
