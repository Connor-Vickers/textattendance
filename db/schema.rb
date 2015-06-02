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

ActiveRecord::Schema.define(version: 20150602181057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "meetings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.string   "when"
    t.string   "auth"
  end

  add_index "meetings", ["course_id"], name: "index_meetings_on_course_id", using: :btree

  create_table "records", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meeting_id"
    t.integer  "student_id"
    t.integer  "value"
  end

  add_index "records", ["student_id", "meeting_id"], name: "index_records_on_student_id_and_meeting_id", unique: true, using: :btree

  create_table "students", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.string   "first"
    t.string   "last"
    t.string   "number"
  end

  add_index "students", ["number", "course_id"], name: "index_students_on_number_and_course_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email_check"
    t.integer  "login_attempts"
  end

end
