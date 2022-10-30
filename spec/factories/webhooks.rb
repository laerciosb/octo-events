# frozen_string_literal: true

FactoryBot.define do
  factory :webhook do
    integration { Webhook::ENABLED.values.sample }
    payload { '' }
  end
end
