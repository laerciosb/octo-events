# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  USERNAME = ENV['HTTP_USERNAME']
  PASSWORD = ENV['HTTP_PASSWORD']

  included do
    before_action :http_basic_auth
  end

  private

  def http_basic_auth
    compare = ->(given, value) { Rack::Utils.secure_compare(given, value) }
    message = { message: 'HTTP Basic: Access denied.' }.to_json

    authenticate_or_request_with_http_basic(nil, message) do |username, password|
      compare.call(username.to_s, USERNAME) & compare.call(password.to_s, PASSWORD)
    end
  end
end
