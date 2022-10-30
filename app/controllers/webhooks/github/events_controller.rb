# frozen_string_literal: true

module Webhooks::Github
  class EventsController < BaseController
    # POST /webhooks/github/events
    def create
      Webhooks::Github::CreateEvent.run(payload: create_params)

      head :created
    end

    private

    def create_params
      JSON.parse(request.body.read, symbolize_names: true)
    end
  end
end
