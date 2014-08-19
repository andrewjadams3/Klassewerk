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

ActiveRecord::Schema.define(version: 20140819194218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "responses", force: true do |t|
    t.integer  "student_id"
    t.integer  "worksheet_id"
    t.json     "answers"
    t.boolean  "submitted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json     "grading"
    t.string   "notes"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password_digest"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["username"], name: "index_students_on_username", unique: true, using: :btree

  create_table "teachers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "class_code"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["class_code"], name: "index_teachers_on_class_code", unique: true, using: :btree
  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree

  create_table "worksheets", force: true do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.string   "url"
    t.json     "input_fields"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
