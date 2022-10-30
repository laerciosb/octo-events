# frozen_string_literal: true

require 'jsonapi/serializer'

module Renderization
  def render_jsonapi(json: nil, serializer: nil, status: nil)
    render(json: serializer.new(json).serializable_hash, status: status || :ok)
  end
end
