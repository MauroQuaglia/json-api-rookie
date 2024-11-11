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

    paths = [
      Rails.root.join('lib')
    ]
    config.autoload_paths += paths
    config.eager_load_paths += paths
  end
end