require_relative "boot"

require "rails"
require "active_model/railtie"
require "action_controller/railtie"
require "action_view/railtie"
#require "active_record/railtie"

Bundler.require(*Rails.groups)

module JsonApiRookie
  class Application < Rails::Application
    config.load_defaults(Rails::VERSION::STRING.to_f)
    config.generators.system_tests = nil
  end
end