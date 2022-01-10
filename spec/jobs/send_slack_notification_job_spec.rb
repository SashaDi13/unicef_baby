require 'rails_helper'

RSpec.describe SendSlackNotificationJob, type: :job do
  describe "#perform" do
    it "send notifier to slack" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        SendSlackNotificationJob.perform_later("New article")
      }.to enqueue_job
    end
  end
end
