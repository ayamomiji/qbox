# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QuestionBox
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Asia/Taipei"
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.default_locale = :'zh-TW'

    config.hosts.clear

    # Generate UUID as primary key.
    config.generators.orm :active_record, primary_key_type: :uuid

    # Do not generate fixtures (will use factory_bot later)
    config.generators.test_framework :test_unit, fixture: false
  end
end
