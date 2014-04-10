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

ActiveRecord::Schema.define(version: 20140410113827) do

  create_table "contacts", force: true do |t|
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["email"], name: "index_contacts_on_email", unique: true

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

  create_table "lecture_contacts", force: true do |t|
    t.integer  "lecture_id", null: false
    t.integer  "contact_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lecture_contacts", ["lecture_id", "contact_id"], name: "index_lecture_contacts_on_lecture_id_and_contact_id", unique: true

  create_table "lecture_lecturers", force: true do |t|
    t.integer  "lecture_id",  null: false
    t.integer  "lecturer_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lecture_lecturers", ["lecture_id", "lecturer_id"], name: "index_lecture_lecturers_on_lecture_id_and_lecturer_id", unique: true

  create_table "lecturers", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lecturers", ["name"], name: "index_lecturers_on_name", unique: true

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
    t.integer  "grade",              null: false
    t.integer  "department_id",      null: false
    t.integer  "course_id"
    t.integer  "year"
  end

  add_index "lectures", ["credit"], name: "index_lectures_on_credit"
  add_index "lectures", ["department_id"], name: "index_lectures_on_department_id"
  add_index "lectures", ["divide"], name: "index_lectures_on_divide"
  add_index "lectures", ["grade", "department_id", "course_id"], name: "index_lectures_on_grade_and_department_id_and_course_id"
  add_index "lectures", ["grade", "department_id"], name: "index_lectures_on_grade_and_department_id"
  add_index "lectures", ["grade"], name: "index_lectures_on_grade"
  add_index "lectures", ["required_selective"], name: "index_lectures_on_required_selective"
  add_index "lectures", ["term"], name: "index_lectures_on_term"
  add_index "lectures", ["title"], name: "index_lectures_on_title"

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["name"], name: "index_locations_on_name", unique: true

  create_table "plans", force: true do |t|
    t.integer  "lecture_id", null: false
    t.integer  "number",     null: false
    t.string   "title"
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["lecture_id"], name: "index_plans_on_lecture_id"
  add_index "plans", ["number"], name: "index_plans_on_number"

  create_table "timetables", force: true do |t|
    t.integer  "lecture_id",  null: false
    t.integer  "year",        null: false
    t.string   "term",        null: false
    t.integer  "wday",        null: false
    t.integer  "period",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  add_index "timetables", ["lecture_id"], name: "index_timetables_on_lecture_id"
  add_index "timetables", ["year", "wday", "period"], name: "index_timetables_on_year_and_wday_and_period"
  add_index "timetables", ["year", "wday"], name: "index_timetables_on_year_and_wday"

end
