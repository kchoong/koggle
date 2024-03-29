require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Koggle
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Where the I18n library should search for translation files
    config.i18n.load_path += Dir[Rails.root.join('locales', '*.{rb,yml}')]

    # Permitted locales available for the application
    config.i18n.available_locales = [:en, :de]

    # Set default locale to something other than :en
    config.i18n.default_locale = :en
  end
end
