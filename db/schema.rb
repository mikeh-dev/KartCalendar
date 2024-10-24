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

ActiveRecord::Schema[7.0].define(version: 2024_10_24_202351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "key"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_api_keys_on_key", unique: true
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_championships", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "championship_id", null: false
  end

  create_table "categories_events", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "event_id", null: false
  end

  create_table "categories_tracks", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "track_id", null: false
  end

  create_table "championships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.text "description"
    t.string "logo"
    t.string "price"
    t.bigint "event_id"
    t.string "contact_number"
    t.string "mobile"
    t.string "website"
    t.string "email"
    t.string "short_name"
    t.string "long_name"
    t.string "test_fee"
    t.string "race_fee"
    t.string "champ_fee"
    t.string "tagline"
    t.string "champ_type"
    t.text "social_media"
    t.string "licence"
    t.bigint "home_track_id"
    t.bigint "user_id"
    t.string "non_member_race_fee"
    t.index ["event_id"], name: "index_championships_on_event_id"
    t.index ["home_track_id"], name: "index_championships_on_home_track_id"
    t.index ["user_id"], name: "index_championships_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engines", force: :cascade do |t|
    t.string "engine_number"
    t.string "engine_make"
    t.string "engine_model"
    t.string "barrel_number"
    t.string "seal_number"
    t.string "year_manufactured"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "notes"
    t.index ["engine_number"], name: "index_engines_on_engine_number"
    t.index ["user_id"], name: "index_engines_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_type"
    t.string "image"
    t.bigint "championship_id"
    t.bigint "track_id"
    t.date "start_date"
    t.date "end_date"
    t.string "licence"
    t.string "member_entry_fee"
    t.string "non_member_entry_fee"
    t.text "arrival_instructions"
    t.text "nominated_fuel_station"
    t.string "paddock_booking_contact"
    t.string "live_timing_link"
    t.index ["championship_id"], name: "index_events_on_championship_id"
    t.index ["end_date"], name: "index_events_on_end_date"
    t.index ["event_type"], name: "index_events_on_event_type"
    t.index ["start_date"], name: "index_events_on_start_date"
    t.index ["track_id"], name: "index_events_on_track_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type", null: false
    t.bigint "followable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable"
    t.index ["user_id", "followable_id", "followable_type"], name: "index_follows_on_user_and_followable", unique: true
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "service_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "engine_id"
    t.date "date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "engine_builder"
    t.text "notes"
    t.string "new_seal_number"
    t.string "old_seal_number"
    t.index ["engine_id"], name: "index_service_records_on_engine_id"
    t.index ["user_id"], name: "index_service_records_on_user_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact_number"
    t.integer "length"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "location"
    t.string "logo"
    t.string "short_desc"
    t.string "tagline"
    t.string "facilities", default: [], array: true
    t.string "website"
    t.string "static_map_url"
    t.string "mobile"
    t.string "facebook"
    t.string "instagram"
    t.float "latitude"
    t.float "longitude"
    t.string "live_timing"
    t.string "track_surface"
    t.string "paddock_email"
    t.bigint "user_id"
    t.index ["name"], name: "index_tracks_on_name"
    t.index ["user_id"], name: "index_tracks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "api_keys", "users"
  add_foreign_key "championships", "events"
  add_foreign_key "championships", "tracks", column: "home_track_id"
  add_foreign_key "championships", "users"
  add_foreign_key "engines", "users"
  add_foreign_key "events", "championships"
  add_foreign_key "events", "tracks"
  add_foreign_key "follows", "users"
  add_foreign_key "service_records", "engines"
  add_foreign_key "service_records", "users"
  add_foreign_key "tracks", "users"
end
