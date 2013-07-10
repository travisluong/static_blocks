StaticBlocks.config do |config|
  config.http_auth = false
  config.username = ENV['STATIC_BLOCKS_USERNAME']
  config.password = ENV['STATIC_BLOCKS_PASSWORD']
  config.wysihtml5 = true
  config.globalize = false
  config.locales = ['en']
end
