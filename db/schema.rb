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

ActiveRecord::Schema.define(version: 20140319170756) do

  create_table "courses", force: true do |t|
    t.string   "name",       null: false
    t.string   "abbr",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["abbr"], name: "index_courses_on_abbr", unique: true
  add_index "courses", ["name"], name: "index_courses_on_name", unique: true

  create_table "departments", force: true do |t|
    t.string   "name",       null: false
    t.string   "abbr",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["abbr"], name: "index_departments_on_abbr", unique: true
  add_index "departments", ["name"], name: "index_departments_on_name", unique: true

  create_table "lectures", force: true do |t|
    t.string   "title",              null: false
    t.string   "required_selective", null: false
    t.string   "divide",             null: false
    t.string   "term",               null: false
    t.integer  "credit",             null: false
    t.string   "category"
    t.text     "abstract"
    t.text     "failure_absence"
    t.text     "evaluation"
    t.text     "textbooks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lectures", ["credit"], name: "index_lectures_on_credit", unique: true
  add_index "lectures", ["divide"], name: "index_lectures_on_divide", unique: true
  add_index "lectures", ["required_selective"], name: "index_lectures_on_required_selective", unique: true
  add_index "lectures", ["term"], name: "index_lectures_on_term", unique: true
  add_index "lectures", ["title"], name: "index_lectures_on_title", unique: true

end
