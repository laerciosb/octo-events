# frozen_string_literal: true

require 'jsonapi/serializer'

module Serialization
  def self.included(base)
    base.class_eval do
      include JSONAPI::Serializer
    end
  end
end
