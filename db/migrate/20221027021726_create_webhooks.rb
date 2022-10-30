# frozen_string_literal: true

class CreateWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :webhooks do |t|
      t.integer :integration, null: false, index: true
      t.jsonb :payload, null: false, default: {}

      t.check_constraint 'integration in (0)'

      t.timestamps
    end
  end
end
