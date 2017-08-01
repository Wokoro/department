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

ActiveRecord::Schema.define(version: 20170702081725) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assignment_submissions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "assignment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assignment_id"], name: "index_assignment_submissions_on_assignment_id"
    t.index ["student_id"], name: "index_assignment_submissions_on_student_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "lecturer_id",     null: false
    t.integer  "course_id",       null: false
    t.string   "session",         null: false
    t.datetime "submission_date"
    t.string   "assignment_path"
    t.string   "file"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["course_id"], name: "index_assignments_on_course_id"
    t.index ["lecturer_id"], name: "index_assignments_on_lecturer_id"
    t.index ["session"], name: "index_assignments_on_session"
  end

  create_table "course_allocations", force: :cascade do |t|
    t.integer  "lecturer_id"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["course_id"], name: "index_course_allocations_on_course_id"
    t.index ["lecturer_id"], name: "index_course_allocations_on_lecturer_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string  "ccode",    null: false
    t.string  "ctitle",   null: false
    t.integer "units"
    t.integer "level",    null: false
    t.integer "semester", null: false
    t.index ["ccode"], name: "index_courses_on_ccode"
  end

  create_table "lecturer_othernames", force: :cascade do |t|
    t.integer "lecturer_id"
    t.string  "othernames"
    t.index ["lecturer_id"], name: "index_lecturer_othernames_on_lecturer_id"
  end

  create_table "lecturers", force: :cascade do |t|
    t.string  "staff_id",        null: false
    t.string  "sname",           null: false
    t.string  "fname",           null: false
    t.integer "sex",             null: false
    t.string  "state_of_origin", null: false
    t.string  "lga",             null: false
    t.string  "nationality",     null: false
    t.string  "religion"
    t.string  "phone"
    t.string  "email"
    t.binary  "passport"
    t.string  "password"
    t.index ["fname"], name: "index_lecturers_on_fname"
    t.index ["password"], name: "index_lecturers_on_password"
    t.index ["sname"], name: "index_lecturers_on_sname"
    t.index ["staff_id"], name: "index_lecturers_on_staff_id"
  end

  create_table "login_details", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "password",               null: false
    t.integer  "user_type",              null: false
    t.integer  "activation", default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["password"], name: "index_login_details_on_password"
    t.index ["user_id"], name: "index_login_details_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "enc_id"
    t.index ["enc_id"], name: "index_news_on_enc_id", unique: true
    t.index ["id"], name: "index_news_on_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.string   "session",                   null: false
    t.integer  "C_A_score",     default: 0
    t.integer  "exam_score",    default: 0
    t.integer  "year_of_study",             null: false
    t.integer  "status",                    null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "units"
    t.index ["course_id"], name: "index_registrations_on_course_id"
    t.index ["session"], name: "index_registrations_on_session"
    t.index ["student_id"], name: "index_registrations_on_student_id"
    t.index ["year_of_study"], name: "index_registrations_on_year_of_study"
  end

  create_table "student_othernames", force: :cascade do |t|
    t.integer "student_id"
    t.string  "othernames"
    t.index ["student_id"], name: "index_student_othernames_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string  "matno",                         null: false
    t.string  "sname",                         null: false
    t.string  "fname",                         null: false
    t.integer "sex",                           null: false
    t.string  "state_of_origin",               null: false
    t.string  "lga",                           null: false
    t.string  "nationality",                   null: false
    t.string  "religion"
    t.string  "phone"
    t.string  "email"
    t.binary  "passport"
    t.string  "password"
    t.integer "level",           default: 100, null: false
    t.index ["fname"], name: "index_students_on_fname"
    t.index ["matno"], name: "index_students_on_matno"
    t.index ["password"], name: "index_students_on_password"
    t.index ["sname"], name: "index_students_on_sname"
  end

  create_table "utils", force: :cascade do |t|
    t.string  "name"
    t.string  "value"
    t.integer "status"
    t.index ["name"], name: "index_utils_on_name"
    t.index ["status"], name: "index_utils_on_status"
    t.index ["value"], name: "index_utils_on_value"
  end

end
