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

ActiveRecord::Schema.define(version: 20150925124748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charities", force: :cascade do |t|
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
    t.string   "organisation_title"
    t.string   "status"
    t.string   "number"
  end

  add_index "charities", ["email"], name: "index_charities_on_email", unique: true, using: :btree
  add_index "charities", ["reset_password_token"], name: "index_charities_on_reset_password_token", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "link"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "requests", force: :cascade do |t|
    t.string   "contact_person"
    t.string   "contact_email"
    t.integer  "contact_phone"
    t.string   "project_description"
    t.string   "thoughts"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "charity_id"
    t.string   "meeting_frequency"
    t.string   "expected_duration"
    t.string   "organisation_name"
  end

  add_index "requests", ["charity_id"], name: "index_requests_on_charity_id", using: :btree

  add_foreign_key "requests", "charities"
end