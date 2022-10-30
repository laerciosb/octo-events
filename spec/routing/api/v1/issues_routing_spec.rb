# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::IssuesController, type: :routing do
  let(:resource) { 'api/v1/issues' }

  describe 'routing' do
    it 'routes to #events via GET' do
      expect(get: '/issues/1/events').to route_to("#{resource}#events", number: '1', format: :json)
    end
  end
end
