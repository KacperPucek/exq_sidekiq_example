redis_options = {
  namespace: "rms-#{Rails.env}",
  url: ENV.fetch("REDIS_URL") { "redis://127.0.0.1:6379" },
}

Sidekiq.configure_server do |config|
  config.redis = redis_options
end

Sidekiq.configure_client do |config|
  config.redis = redis_options
end
