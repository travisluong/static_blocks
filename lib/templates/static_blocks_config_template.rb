StaticBlocks.config do |config|
  config.locales = ['en']
  config.http_auth = true
  config.username = ENV['STATIC_BLOCKS_USERNAME'] || 'admin'
  config.password = ENV['STATIC_BLOCKS_PASSWORD'] || 'password'
end
