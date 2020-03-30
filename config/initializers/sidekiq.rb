Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] || ENV['REDISTOGO_URL'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] || ENV['REDISTOGO_URL'] }
end
