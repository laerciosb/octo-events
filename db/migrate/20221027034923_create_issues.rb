# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.integer :number, null: false, index: { unique: true }

      t.check_constraint 'number > 0'
      t.timestamps
    end
  end
end
