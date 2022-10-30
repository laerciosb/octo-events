# frozen_string_literal: true

module Webhooks::Github
  class CreateEvent < ActiveInteraction::Base
    object :payload, class: Hash

    validates :payload, presence: true

    attr_reader :webhook

    def execute
      @webhook = create_webhook
      create_event if issue_params.present?
    end

    private

    def create_webhook
      Webhook.create!(integration: :github, payload:)
    end

    def create_event
      Event.create!(
        action: payload[:action],
        comment: payload.dig(:comment, :body),
        created_at: payload[:created_at],
        updated_at: payload[:updated_at],
        triggerable: find_or_create_issue,
        webhook:
      )
    end

    def find_or_create_issue
      Issue.find_or_create_by!(number: issue_params[:number])
    end

    def issue_params
      @issue_params ||= payload[:issue]
    end
  end
end
