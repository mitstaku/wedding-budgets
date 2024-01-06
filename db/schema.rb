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

ActiveRecord::Schema[7.0].define(version: 2024_01_06_073447) do
  create_table "beauties", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "beauty_type"
    t.decimal "beauty_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_beauties_on_event_quote_id"
  end

  create_table "ceremonies", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "ceremony_type"
    t.decimal "ceremony_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_ceremonies_on_event_quote_id"
  end

  create_table "costumes", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "costume_type"
    t.decimal "costume_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_costumes_on_event_quote_id"
  end

  create_table "event_quotes", charset: "utf8", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.integer "version_number", null: false
    t.text "detail"
    t.decimal "cost", precision: 10, null: false
    t.date "input_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_quotes_on_event_id"
  end

  create_table "events", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.date "event_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "flowers", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "flower_type"
    t.decimal "flower_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_flowers_on_event_quote_id"
  end

  create_table "foods", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "food_type"
    t.decimal "food_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_foods_on_event_quote_id"
  end

  create_table "gifts", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "gift_type"
    t.decimal "gift_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_gifts_on_event_quote_id"
  end

  create_table "guests", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.string "adult_count", null: false
    t.string "child_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_guests_on_event_quote_id"
  end

  create_table "photos", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "photo_type"
    t.decimal "photo_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_photos_on_event_quote_id"
  end

  create_table "pre_ceremonies", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "pre_ceremony_type"
    t.decimal "pre_ceremony_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_pre_ceremonies_on_event_quote_id"
  end

  create_table "prints", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "print_type"
    t.decimal "print_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_prints_on_event_quote_id"
  end

  create_table "stagings", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "staging_type"
    t.decimal "staging_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_stagings_on_event_quote_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "venue_type"
    t.decimal "venue_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_venues_on_event_quote_id"
  end

  create_table "videos", charset: "utf8", force: :cascade do |t|
    t.bigint "event_quote_id", null: false
    t.integer "video_type"
    t.decimal "video_cost", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_quote_id"], name: "index_videos_on_event_quote_id"
  end

  add_foreign_key "beauties", "event_quotes"
  add_foreign_key "ceremonies", "event_quotes"
  add_foreign_key "costumes", "event_quotes"
  add_foreign_key "event_quotes", "events"
  add_foreign_key "events", "users"
  add_foreign_key "flowers", "event_quotes"
  add_foreign_key "foods", "event_quotes"
  add_foreign_key "gifts", "event_quotes"
  add_foreign_key "guests", "event_quotes"
  add_foreign_key "photos", "event_quotes"
  add_foreign_key "pre_ceremonies", "event_quotes"
  add_foreign_key "prints", "event_quotes"
  add_foreign_key "stagings", "event_quotes"
  add_foreign_key "venues", "event_quotes"
  add_foreign_key "videos", "event_quotes"
end
