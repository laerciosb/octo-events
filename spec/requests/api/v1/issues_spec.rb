# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/issues', type: :request do
  let(:valid_headers) { basic_auth_headers }

  describe 'GET /events' do
    let(:issue) { create(:issue_with_events) }

    it 'renders a successful response' do
      get events_v1_issue_url(issue.number), headers: valid_headers, as: :json

      expect(response).to be_successful
    end

    it 'renders a not found response' do
      get events_v1_issue_url(100_000), headers: valid_headers, as: :json

      expect(response).to have_http_status(:not_found)
    end

    it 'renders a unauthorized response' do
      get events_v1_issue_url(issue.number), as: :json

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
