# frozen_string_literal: true

module Github
  module Constants
    EVENTS = {
      issue_comment: %w[created],
      issue: %w[
        opened edited deleted transferred pinned unpinned closed reopened assigned
        unassigned labeled unlabeled locked unlocked milestoned demilestoned
      ]
    }.freeze
  end
end
