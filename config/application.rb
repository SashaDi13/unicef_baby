require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
require 'dotenv'
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module UnicefBaby
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.active_job.queue_adapter = :sidekiq

    Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV['ELASTICSEARCH_URL'] || "localhost:9200"

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
