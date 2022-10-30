# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    webhook
    association :triggerable, factory: %i[issue].sample

    action { Event::ENABLED[triggerable_type].sample }

    trait :issue do
      association :triggerable, factory: :issue
    end
  end
end
