require 'rails/generators'

module StaticBlocks
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path("../../templates", __FILE__)

      def copy_static_blocks_config
        copy_file "static_blocks_config_template.rb", "config/initializers/static_blocks.rb"
      end

      def copy_migrations
        rake('static_blocks:install:migrations')
      end

      def add_mount_route
        route 'mount StaticBlocks::Engine => "/static_blocks"'
      end
    end
  end
end
