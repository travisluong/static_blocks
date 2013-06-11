module StaticBlocks
  class Engine < ::Rails::Engine
    isolate_namespace StaticBlocks
    config.generators.integration_tool :rspec
    config.generators.test_framework :rspec
  end
end
