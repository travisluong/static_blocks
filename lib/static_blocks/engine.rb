require "jquery-rails"
require "sass-rails"
require "bootstrap-sass"
require "bootstrap-wysihtml5-rails"
require "ransack"
require "kaminari"
require "bootstrap-kaminari-views"
require "globalize3"

module StaticBlocks
  class Engine < ::Rails::Engine
    isolate_namespace StaticBlocks
    config.generators.integration_tool :rspec
    config.generators.test_framework :rspec
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
