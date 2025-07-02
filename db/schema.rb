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

ActiveRecord::Schema[8.0].define(version: 2025_06_29_004644) do
  create_table "experiments", force: :cascade do |t|
    t.string "name"
    t.text "hypothesis"
    t.text "actions_taken"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "status"
    t.text "inspection_summary"
    t.text "adaptation_summary"
    t.integer "goal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_experiments_on_goal_id"
  end

  create_table "goal_kvms", force: :cascade do |t|
    t.integer "goal_id", null: false
    t.integer "kvm_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_goal_kvms_on_goal_id"
    t.index ["kvm_id"], name: "index_goal_kvms_on_kvm_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "goal_type"
    t.string "status"
    t.date "target_date"
    t.integer "organization_id", null: false
    t.integer "parent_goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_goals_on_organization_id"
    t.index ["parent_goal_id"], name: "index_goals_on_parent_goal_id"
  end

  create_table "kvas", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kvms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "unit_of_measure"
    t.boolean "is_active"
    t.integer "organization_id", null: false
    t.integer "kva_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kva_id"], name: "index_kvms_on_kva_id"
    t.index ["organization_id"], name: "index_kvms_on_organization_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.decimal "value", precision: 15, scale: 2
    t.datetime "measurement_date"
    t.text "notes"
    t.integer "kvm_id", null: false
    t.integer "experiment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_measurements_on_experiment_id"
    t.index ["kvm_id"], name: "index_measurements_on_kvm_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "vision_statement"
    t.text "mission_statement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "experiments", "goals"
  add_foreign_key "goal_kvms", "goals"
  add_foreign_key "goal_kvms", "kvms"
  add_foreign_key "goals", "goals", column: "parent_goal_id"
  add_foreign_key "goals", "organizations"
  add_foreign_key "kvms", "kvas"
  add_foreign_key "kvms", "organizations"
  add_foreign_key "measurements", "experiments"
  add_foreign_key "measurements", "kvms"
  add_foreign_key "sessions", "users"
end
