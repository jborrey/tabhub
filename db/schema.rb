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

ActiveRecord::Schema.define(version: 20160704223202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "university"
    t.string   "location"
    t.integer  "president_id"
    t.string   "website"
    t.string   "twitter_handle"
    t.string   "facebook_page"
    t.string   "youtube_channel"
    t.date     "founded_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "location"
    t.text     "description"
    t.string   "debate_format"
    t.string   "tournament_type"
    t.integer  "number_of_rounds"
    t.integer  "owner_id"
    t.integer  "institution_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username",   limit: 24
    t.string   "email"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
