# Good starting config from
# http://sourcey.com/building-the-prefect-rails-5-api-only-app
class Rack::Attack
  # `Rack::Attack` is configured to use the `Rails.cache` value by default,
  # but you can override that by setting the `Rack::Attack.cache.store` value
  # Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  # Don't need this yet.

  # Allow all local traffic
  whitelist('allow-localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  # Allow an IP address to make 10 requests every 5 seconds
  throttle('req/ip', limit: 10, period: 5, &:ip)

  # Send the following response to throttled clients
  self.throttled_response = lambda do |env|
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
      429,
      {
        'Content-Type' => 'application/json',
        'Retry-After' => retry_after.to_s
      },
      [{ error: 'Throttle limit reached. Retry later.' }.to_json]
    ]
  end
end
