# frozen_string_literal: true

module Rack
  class Attack
    # Always allow requests from localhost
    # (blocklist & throttles are skipped)
    safelist('allow from localhost') do |req|
      # Requests are allowed if the return value is truthy
      req.ip == '127.0.0.1' || req.ip == '::1'
    end

    # Throttle requests to 5 requests per second per ip
    throttle('req/ip', limit: 5, period: 1.second, &:ip)
  end
end
