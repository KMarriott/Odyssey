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

ActiveRecord::Schema.define(version: 20170501212352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "place"
    t.string   "comment"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "cuba_trips", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "image"
    t.string   "flight"
    t.string   "flight_date"
    t.string   "address"
    t.string   "profile_image"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_cuba_trips_on_user_id", using: :btree
  end

  create_table "oahu", force: :cascade do |t|
    t.string  "name"
    t.string  "image"
    t.string  "flight"
    t.string  "flight_date"
    t.string  "address"
    t.string  "profile_image"
    t.integer "user_id"
    t.index ["user_id"], name: "index_oahu_on_user_id", using: :btree
  end

  create_table "oahus", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "image"
    t.string   "flight"
    t.string   "flight_date"
    t.string   "address"
    t.string   "profile_image"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_oahus_on_user_id", using: :btree
  end

  create_table "paris", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "image"
    t.string   "flight"
    t.string   "flight_date"
    t.string   "address"
    t.string   "profile_image"
    t.integer  "users_id"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_paris_on_user_id", using: :btree
    t.index ["users_id"], name: "index_paris_on_users_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.string   "flights"
    t.string   "airbnb"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "flight"
    t.string   "flight_date"
    t.string   "address"
    t.string   "profile_image"
    t.index ["user_id"], name: "index_trips_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "users"
  add_foreign_key "cuba_trips", "users"
  add_foreign_key "oahu", "users"
  add_foreign_key "oahus", "users"
  add_foreign_key "paris", "users"
  add_foreign_key "trips", "users"
end
