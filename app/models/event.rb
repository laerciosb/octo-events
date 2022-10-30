# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id               :bigint           not null, primary key
#  action           :string           not null
#  comment          :text
#  triggerable_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  triggerable_id   :bigint           not null
#  webhook_id       :bigint           not null
#
# Indexes
#
#  index_events_on_triggerable  (triggerable_type,triggerable_id)
#  index_events_on_webhook_id   (webhook_id)
#
# Foreign Keys
#
#  fk_rails_...  (webhook_id => webhooks.id)
#

require 'github/constants'

class Event < ApplicationRecord
  ENABLED = {
    'Issue' => Github::Constants::EVENTS.slice(:issue_comment, :issue).values.flatten
  }.freeze

  #== ASSOCIATIONS =========================================
  belongs_to :webhook
  belongs_to :triggerable, polymorphic: true, dependent: :destroy

  #== VALIDATIONS ==========================================
  validates :action, presence: true
  validates :triggerable_type, inclusion: { in: ENABLED.keys }
  validates :action, inclusion: { in: ->(event) { ENABLED[event.triggerable_type] } }, if: :triggerable_type
end
