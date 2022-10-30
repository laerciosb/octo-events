# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.text :comment
      t.string :action, null: false
      t.references :webhook, null: false, foreign_key: true
      t.references :triggerable, polymorphic: true, null: false, index: true

      t.check_constraint "triggerable_type in ('Issue')"
      t.check_constraint "triggerable_type = 'Issue' and action in (
        'opened', 'edited', 'deleted', 'transferred', 'pinned', 'unpinned',
        'closed', 'reopened', 'assigned', 'unassigned', 'labeled', 'unlabeled',
        'locked', 'unlocked', 'milestoned', 'demilestoned', 'created'
      )"

      t.timestamps
    end
  end
end
