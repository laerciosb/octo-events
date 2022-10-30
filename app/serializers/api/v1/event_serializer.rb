# frozen_string_literal: true

module Api::V1
  class EventSerializer < ApplicationSerializer
    attributes :action, :comment, :created_at
  end
end
