# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160911231206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "difficulty_ratings", force: :cascade do |t|
    t.integer "title_id"
    t.integer "user_id"
    t.integer "difficulty_id"
  end

  add_index "difficulty_ratings", ["title_id"], name: "index_difficulty_ratings_on_title_id", using: :btree
  add_index "difficulty_ratings", ["user_id"], name: "index_difficulty_ratings_on_user_id", using: :btree

  create_table "title_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "titles", force: :cascade do |t|
    t.string   "name"
    t.string   "external_id"
    t.text     "summary"
    t.datetime "last_sync"
    t.integer  "title_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "titles", ["title_type_id"], name: "index_titles_on_title_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "difficulty_ratings", "titles"
  add_foreign_key "difficulty_ratings", "users"
  add_foreign_key "titles", "title_types"
end
