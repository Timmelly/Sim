# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170114133104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "computer_statuses", force: :cascade do |t|
    t.integer  "status"
    t.jsonb    "users"
    t.integer  "computer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["computer_id"], name: "index_computer_statuses_on_computer_id", using: :btree
  end

  create_table "computers", force: :cascade do |t|
    t.string   "ip"
    t.string   "mac"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "last_system_changings", force: :cascade do |t|
    t.datetime "changing_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "token"
    t.date     "date_end"
    t.string   "api_action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "password"
    t.integer  "role"
    t.text     "info"
    t.boolean  "is_blocked", default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_foreign_key "computer_statuses", "computers"
end
