Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.secrets.redis_url, 
                    password: Rails.application.secrets.redis_password }
end
Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.secrets.redis_url, 
                    password: Rails.application.secrets.redis_password }
end