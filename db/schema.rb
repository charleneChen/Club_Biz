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

ActiveRecord::Schema.define(version: 20140525085352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "event_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "event_id"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "event_type"
    t.text     "content"
    t.decimal  "ticket_price"
    t.integer  "ticket_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.time     "time"
    t.string   "venue"
    t.integer  "society_id"
  end

  create_table "followings", force: true do |t|
    t.integer  "student_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupships", force: true do |t|
    t.integer  "group_id"
    t.integer  "society_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "student_id"
    t.integer  "society_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["society_id"], name: "index_memberships_on_society_id", using: :btree
  add_index "memberships", ["student_id", "society_id"], name: "index_memberships_on_student_id_and_society_id", unique: true, using: :btree
  add_index "memberships", ["student_id"], name: "index_memberships_on_student_id", using: :btree

  create_table "societies", force: true do |t|
    t.string   "club_name"
    t.string   "username"
    t.string   "password"
    t.string   "admin_name"
    t.string   "admin_phone"
    t.string   "admin_email"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_digest"
    t.string   "password_confirmation"
  end

  add_index "students", ["remember_token"], name: "index_students_on_remember_token", using: :btree

end
