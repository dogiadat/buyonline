require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Easy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "Hanoi"
    config.i18n.load_path += Dir["#{Rails.root.to_s}/config/locales/**/**/*.{rb,yml}"]
    config.i18n.default_locale = :vi
    # config.active_record.default_timezone = :local
  end
end
