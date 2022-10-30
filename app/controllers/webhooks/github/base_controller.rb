# frozen_string_literal: true

require 'github/signature'

module Webhooks::Github
  class BaseController < ::ApplicationController
    before_action :verify_signature!

    private

    def verify_signature!
      head :unauthorized unless signature_check!
    end

    def signature_check!
      Github::Signature.check!(
        body: request.body,
        signature: request.env['HTTP_X_HUB_SIGNATURE_256']
      )
    end
  end
end
