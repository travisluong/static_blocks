StaticBlocks.config do |config|
  config.locales = ['en']
  config.http_auth = false
  config.username = ENV['STATIC_BLOCKS_USERNAME']
  config.password = ENV['STATIC_BLOCKS_PASSWORD']
end
