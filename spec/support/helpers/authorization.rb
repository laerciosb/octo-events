# frozen_string_literal: true

module Authorization
  USERNAME = ENV['HTTP_USERNAME']
  PASSWORD = ENV['HTTP_PASSWORD']

  def basic_auth_headers
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json',
      'Authorization' => credentials
    }
  end

  private

  def credentials
    @credentials ||=
      ActionController::HttpAuthentication::Basic.encode_credentials(USERNAME, PASSWORD)
  end
end

RSpec.configure do |config|
  config.include Authorization
end
