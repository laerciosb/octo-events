# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Webhooks::Github::EventsController, type: :routing do
  let(:resource) { 'webhooks/github/events' }

  describe 'routing' do
    it 'routes to #create via POST' do
      expect(post: "/#{resource}").to route_to("#{resource}#create", format: :json)
    end
  end
end
