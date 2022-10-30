# frozen_string_literal: true

module Api::V1
  class BaseController < ::ApplicationController
    include Authentication
    include Pagination
    include Renderization

    rescue_from ActiveRecord::RecordNotFound do |e|
      e.message.match(/find (\w+)/)
      message = I18n.t('activerecord.exceptions.not_found', klass: ::Regexp.last_match(1), id: e.id)

      render json: { errors: [{ message: }] }, status: :not_found
    end
  end
end
