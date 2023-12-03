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

ActiveRecord::Schema[7.1].define(version: 2023_12_03_010910) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id", null: false
    t.bigint "form_id", null: false
    t.index ["form_id"], name: "index_assignments_on_form_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.serial "application_number", null: false
    t.date "date"
    t.text "address"
    t.text "justification"
    t.integer "status", default: 0
    t.integer "priority_level"
    t.date "deadline"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "company_id", null: false
    t.integer "role", default: 0
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "assignments", "forms"
  add_foreign_key "assignments", "users"
  add_foreign_key "forms", "users"
  add_foreign_key "users", "companies"
end
