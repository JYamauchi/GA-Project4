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

ActiveRecord::Schema.define(version: 20150602161009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "profile_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "profile_id"
    t.text    "favorites"
  end

  create_table "inspections", force: :cascade do |t|
    t.integer  "InspectionID"
    t.integer  "restaurant_id"
    t.date     "Date"
    t.time     "Time"
    t.text     "InspectionType"
    t.integer  "CriticalViolations"
    t.integer  "NonCriticalViolations"
    t.integer  "CriticalViolationsCorrectedOnSite"
    t.integer  "CriticalViolationsToBeResolved"
    t.integer  "NonCriticalViolationsCorrectedOnSite"
    t.integer  "NonCriticalViolationsToBeResolved"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "inspections", ["restaurant_id"], name: "index_inspections_on_restaurant_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.integer "profile_id"
  end

  create_table "maps", force: :cascade do |t|
  end

  create_table "potential_violations", force: :cascade do |t|
    t.text     "ViolationNumber"
    t.text     "ViolationDescription"
    t.text     "ViolationCategory"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "name"
    t.text     "photo_url"
    t.text     "hometown"
    t.text     "interests"
    t.text     "favorites"
    t.text     "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.text     "Name"
    t.integer  "PermitID"
    t.text     "Address"
    t.decimal  "Latitude"
    t.decimal  "Longitude"
    t.text     "YelpID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "violations", force: :cascade do |t|
    t.integer  "inspection_id"
    t.integer  "potential_violation_id"
    t.text     "ViolationText"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "violations", ["inspection_id"], name: "index_violations_on_inspection_id", using: :btree
  add_index "violations", ["potential_violation_id"], name: "index_violations_on_potential_violation_id", using: :btree

  add_foreign_key "inspections", "restaurants"
  add_foreign_key "violations", "inspections"
  add_foreign_key "violations", "potential_violations"
end
