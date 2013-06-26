require "jquery-rails"
require "sass-rails"
require "bootstrap-sass"
require "bootstrap-wysihtml5-rails"
require "ransack"
require "kaminari"
require "bootstrap-kaminari-views"
require "globalize3"
require "csv"

module StaticBlocks
  class Engine < ::Rails::Engine
    isolate_namespace StaticBlocks
    config.generators.integration_tool :rspec
    config.generators.test_framework :rspec

    initializer "static_blocks.include_helpers" do
      ActiveSupport.on_load(:action_controller) do
        helper StaticBlocks::StaticBlocksHelper
      end
    end
  end

  def self.config(&block)
    unless defined? @@config
      @@config ||= StaticBlocks::Engine::Configuration.new
      @@config.locales = ['en']
      @@config.http_auth = false
      @@config.username = "admin"
      @@config.password = "password"
    end

    yield @@config if block

    return @@config
  end
end
