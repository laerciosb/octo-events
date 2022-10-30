# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Webhook, type: :model do
  it 'has a valid factory' do
    expect(build(:webhook)).to be_valid
  end

  context 'with database mapping' do
    it { is_expected.to have_db_column(:integration).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:payload).of_type(:jsonb).with_options(null: false, default: {}) }
    it { is_expected.to have_db_index(:integration) }

    include_examples 'timestamps columns'
  end

  context 'with associations' do
    it { is_expected.to have_many(:events).dependent(:destroy) }
  end

  context 'with accepted attributes' do
    it { is_expected.to define_enum_for(:integration).with_values(github: 0).with_prefix(true) }
  end
end
