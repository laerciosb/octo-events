# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'has a valid factory' do
    expect(build(:event)).to be_valid
  end

  context 'with database mapping' do
    it { is_expected.to have_db_column(:action).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:comment).of_type(:text) }
    it { is_expected.to have_db_column(:webhook_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:triggerable_type).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:triggerable_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_index(%i[triggerable_type triggerable_id]) }
    it { is_expected.to have_db_index(:webhook_id) }

    include_examples 'timestamps columns'
  end

  describe 'constants' do
    it 'ENABLED' do
      expect(described_class::ENABLED).to eq(
        'Issue' => Github::Constants::EVENTS.slice(:issue_comment, :issue).values.flatten
      )
    end
  end

  context 'with associations' do
    it { is_expected.to belong_to(:webhook) }
    it { is_expected.to belong_to(:triggerable).dependent(:destroy) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:action) }
    it { is_expected.to allow_value('Issue').for(:triggerable_type) }

    describe 'inclusion when action is a issue' do
      let(:event) { create(:event, :issue) }

      it 'only some values are allowed' do
        expect(event).to allow_value(*Github::Constants::EVENTS.slice(:issue_comment, :issue).values.flatten)
          .for(:action)
      end
    end
  end
end
