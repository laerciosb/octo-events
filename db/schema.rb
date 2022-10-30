# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_27_034923) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.text "comment"
    t.string "action", null: false
    t.bigint "webhook_id", null: false
    t.string "triggerable_type", null: false
    t.bigint "triggerable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["triggerable_type", "triggerable_id"], name: "index_events_on_triggerable"
    t.index ["webhook_id"], name: "index_events_on_webhook_id"
    t.check_constraint "triggerable_type::text = 'Issue'::text AND (action::text = ANY (ARRAY['opened'::character varying, 'edited'::character varying, 'deleted'::character varying, 'transferred'::character varying, 'pinned'::character varying, 'unpinned'::character varying, 'closed'::character varying, 'reopened'::character varying, 'assigned'::character varying, 'unassigned'::character varying, 'labeled'::character varying, 'unlabeled'::character varying, 'locked'::character varying, 'unlocked'::character varying, 'milestoned'::character varying, 'demilestoned'::character varying, 'created'::character varying]::text[]))"
    t.check_constraint "triggerable_type::text = 'Issue'::text"
  end

  create_table "issues", force: :cascade do |t|
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_issues_on_number", unique: true
    t.check_constraint "number > 0"
  end

  create_table "webhooks", force: :cascade do |t|
    t.integer "integration", null: false
    t.jsonb "payload", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["integration"], name: "index_webhooks_on_integration"
    t.check_constraint "integration = 0"
  end

  add_foreign_key "events", "webhooks"
end
