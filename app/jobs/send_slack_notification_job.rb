class SendSlackNotificationJob < ApplicationJob
  queue_as :default

  def perform(text)
    notifier = Slack::Notifier.new ENV['WEBHOOK_URL'], username: ENV['NAME'],
                                                       channel: ENV['CHANNEL'],
                                                       icon_emoji: ":page_facing_up:"
    notifier.ping text
  end
end
