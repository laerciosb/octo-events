# frozen_string_literal: true

module Api::V1
  class IssuesController < BaseController
    before_action :set_issue, only: %i[events]

    # GET /issues/:number/events
    def events
      render_jsonapi json: paginate(@issue.events), serializer: EventSerializer
    end

    private

    def set_issue
      @issue = Issue.find_by!(number: params[:number])
    end
  end
end
