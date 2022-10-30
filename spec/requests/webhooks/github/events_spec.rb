# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/webhooks/github', type: :request do
  describe 'POST /events' do
    let(:file_path) { Rails.root.join('spec/fixtures/requests/webhooks/github/events-create.json') }
    let(:body) { JSON.parse(File.read(file_path)) }
    let(:signature) { 'sha256=3bd380ed5323994bb7aef24691be40b60c1ed3a828e645c25c1baf8e6be7c87d' }

    let(:valid_headers) do
      {
        'RAW_POST_DATA' => body,
        'HTTP_X_HUB_SIGNATURE_256' => signature
      }
    end

    context 'with valid parameters' do
      it 'creates a new Event' do
        expect { post webhooks_github_events_url, headers: valid_headers, as: :json }
          .to change(Webhook, :count).by(1)
          .and change(Event, :count).by(1)
          .and change(Issue, :count).by(1)
      end

      it 'retrieve a created response status' do
        post webhooks_github_events_url, headers: valid_headers, as: :json

        expect(response).to have_http_status(:created)
      end

      it 'retrieve a unauthorized response status' do
        post webhooks_github_events_url, as: :json

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
