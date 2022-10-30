# frozen_string_literal: true

# == Schema Information
#
# Table name: issues
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_issues_on_number  (number) UNIQUE
#
class Issue < ApplicationRecord
  #== ASSOCIATIONS =========================================
  has_many :events, as: :triggerable, inverse_of: :triggerable, dependent: :destroy

  #== VALIDATIONS ==========================================
  validates :number, presence: true
  validates :number, numericality: { only_integer: true, greater_than: 0 }
end
