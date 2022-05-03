# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_03_073356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "available_times", primary_key: "uid", id: :string, force: :cascade do |t|
    t.date "date"
    t.string "available_times", default: [], array: true
    t.string "doctor_uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "booking_times", primary_key: "uid", id: :string, force: :cascade do |t|
    t.date "date"
    t.integer "start_time"
    t.integer "end_time"
    t.string "patient_uid"
    t.string "doctor_uid"
    t.string "link_meeting"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prescriptions", primary_key: "uid", id: :string, force: :cascade do |t|
    t.string "patient_uid"
    t.string "doctor_uid"
    t.string "note"
    t.string "booking_time_uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedule_times", primary_key: "uid", id: :string, force: :cascade do |t|
    t.date "date"
    t.integer "start_time"
    t.integer "end_time"
    t.string "doctor_uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", primary_key: "uid", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "email"
    t.string "major"
    t.string "experience"
    t.string "national_id"
    t.string "religion"
    t.string "residential_address"
    t.string "address"
    t.string "national"
    t.string "province"
    t.string "district"
    t.string "wards"
    t.string "hash_password"
    t.string "phone"
    t.integer "status", default: 0
    t.date "birthday"
    t.integer "role", default: 0
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

end
