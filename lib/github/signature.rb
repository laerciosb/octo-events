# frozen_string_literal: true

module Github
  class Signature
    # Generate env with: ruby -rsecurerandom -e 'puts SecureRandom.hex(20)'
    SECRET_TOKEN = ENV['WEBHOOK_GITHUB_SECRET_TOKEN']

    attr_reader :body, :signature

    def initialize(body:, signature:)
      @body = body
      @signature = signature
    end

    def self.check!(body:, signature:)
      new(body:, signature:).check!
    end

    def check!
      return false if signature.blank?

      body.rewind

      Rack::Utils.secure_compare(hexdigest, signature)
    end

    private

    def hexdigest
      digest = OpenSSL::Digest.new('sha256')

      "sha256=#{OpenSSL::HMAC.hexdigest(digest, SECRET_TOKEN, body.read)}"
    end
  end
end
