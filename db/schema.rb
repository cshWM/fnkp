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

ActiveRecord::Schema.define(version: 20140608104449) do

  create_table "associations", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "address"
    t.string   "postal4"
    t.string   "postal3"
    t.string   "city"
    t.string   "phone"
    t.string   "email"
    t.string   "president"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "athletes", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "sex"
    t.date     "birthdate"
    t.string   "externalCode"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "address"
    t.string   "postal4"
    t.string   "postal3"
    t.string   "city"
    t.string   "phone"
    t.string   "email"
    t.string   "president"
    t.string   "url"
    t.integer  "user_id"
    t.integer  "association_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
