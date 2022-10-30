# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Issue, type: :model do
  it 'has a valid factory' do
    expect(build(:issue)).to be_valid
  end

  context 'with database mapping' do
    it { is_expected.to have_db_column(:number).of_type(:integer) }
    it { is_expected.to have_db_index(:number).unique(true) }

    include_examples 'timestamps columns'
  end

  context 'with associations' do
    it { is_expected.to have_many(:events).inverse_of(:triggerable).dependent(:destroy) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_numericality_of(:number).is_greater_than(0).only_integer }
  end
end
