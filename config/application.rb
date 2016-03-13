require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lelabo
  class Application < Rails::Application
    config.i18n.default_locale = :fr
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.generators do |g|
        g.assets = false
        g.helper = false
    end
    config.filter_parameters += [:password]
    config.log_tags = [
    :host,
    :remote_ip,
    lambda { |request| "#{request.uuid}"[0..15] },
    lambda { |request| "#{request.cookie_jar["_on_ruby_session"]}"[0..15] },
    ]
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.encoding = "utf-8"
    config.autoload_paths += Dir["#{Rails.root}/app/services"]
    config.autoload_paths += Dir["#{Rails.root}/app/validators"]
    config.autoload_paths += Dir["#{Rails.root}/app/jobs"]
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.assets.enabled = true
    config.eager_load_paths += %W(
    #{config.root}/app/services
    )
  end
end
