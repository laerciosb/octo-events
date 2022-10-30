# frozen_string_literal: true

FactoryBot.define do
  factory :issue do
    number { 1 }

    factory :issue_with_events do
      transient do
        events_count { 2 }
      end

      after(:create) do |issue, evaluator|
        create_list(:event, evaluator.events_count, triggerable: issue)
      end
    end
  end
end
