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

ActiveRecord::Schema.define(version: 2018_05_21_220254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.text "url"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "locations", force: :cascade do |t|
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "address"
    t.string "locatable_type"
    t.bigint "locatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "regulars", force: :cascade do |t|
    t.bigint "tender_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tender_id"], name: "index_regulars_on_tender_id"
    t.index ["user_id"], name: "index_regulars_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "dow", default: [], array: true
    t.time "clock_in"
    t.time "clock_out"
    t.date "start_date"
    t.date "end_date"
    t.boolean "light_on"
    t.bigint "venue_id"
    t.bigint "tender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tender_id"], name: "index_schedules_on_tender_id"
    t.index ["venue_id"], name: "index_schedules_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "handle"
    t.string "first"
    t.string "last"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "regulars", "users"
  add_foreign_key "regulars", "users", column: "tender_id"
  add_foreign_key "schedules", "users", column: "tender_id"
  add_foreign_key "schedules", "venues"
end
