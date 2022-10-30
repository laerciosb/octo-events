# frozen_string_literal: true

# == Schema Information
#
# Table name: webhooks
#
#  id          :bigint           not null, primary key
#  integration :integer          not null
#  payload     :jsonb            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_webhooks_on_integration  (integration)
#
class Webhook < ApplicationRecord
  ENABLED = { github: 0 }.freeze

  #== ASSOCIATIONS =========================================
  has_many :events, dependent: :destroy

  #== ACCEPTED ATTRIBUTES ==================================
  enum integration: ENABLED, _prefix: true
end
