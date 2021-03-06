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

ActiveRecord::Schema.define(version: 2019_05_18_191849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "meeting_id"
    t.integer "status", default: 0
    t.bigint "mutation_id"
    t.index ["meeting_id"], name: "index_agreements_on_meeting_id"
    t.index ["mutation_id"], name: "index_agreements_on_mutation_id"
    t.index ["user_id"], name: "index_agreements_on_user_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "mutations", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "meeting_id"
    t.index ["meeting_id"], name: "index_mutations_on_meeting_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slack_id"
    t.boolean "is_admin", default: false
  end

  add_foreign_key "agreements", "meetings"
  add_foreign_key "agreements", "mutations"
  add_foreign_key "agreements", "users"
  add_foreign_key "meetings", "users"
  add_foreign_key "mutations", "meetings"
end
