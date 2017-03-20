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

ActiveRecord::Schema.define(version: 20170318231906) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "courses", primary_key: "ccode", id: :string, force: :cascade do |t|
    t.string  "ctitle"
    t.integer "units"
    t.integer "level"
    t.integer "lecturers_id", null: false
    t.string  "semester"
    t.index ["ccode"], name: "index_courses_on_ccode"
    t.index ["ccode"], name: "sqlite_autoindex_courses_1", unique: true
    t.index ["lecturers_id"], name: "index_courses_on_lecturers_id"
  end

  create_table "lecturers", primary_key: "lecturer_id", id: :string, force: :cascade do |t|
    t.string "sname"
    t.string "fname"
    t.string "password_digest"
    t.index ["lecturer_id"], name: "index_lecturers_on_lecturer_id"
    t.index ["lecturer_id"], name: "sqlite_autoindex_lecturers_1", unique: true
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

  create_table "students", primary_key: "matno", id: :string, force: :cascade do |t|
    t.string  "sname"
    t.string  "fname"
    t.string  "lga"
    t.integer "level"
    t.string  "password_digest"
    t.index ["matno"], name: "index_students_on_matno"
    t.index ["matno"], name: "sqlite_autoindex_students_1", unique: true
  end

end
