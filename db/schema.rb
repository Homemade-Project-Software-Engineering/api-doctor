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

ActiveRecord::Schema.define(version: 20160706212617) do

  create_table "alarms", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "checked"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.datetime "horario"
  end

  add_index "alarms", ["user_id"], name: "index_alarms_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "caregiver_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "relationships", ["caregiver_id"], name: "index_relationships_on_caregiver_id"
  add_index "relationships", ["patient_id", "caregiver_id"], name: "index_relationships_on_patient_id_and_caregiver_id", unique: true
  add_index "relationships", ["patient_id"], name: "index_relationships_on_patient_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "name"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
