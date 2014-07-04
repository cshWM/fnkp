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

ActiveRecord::Schema.define(version: 20140704215343) do

  create_table "association_fee_issues", force: true do |t|
    t.integer  "associationfee_id"
    t.integer  "association_id"
    t.decimal  "value"
    t.integer  "valid_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "association_fee_issues", ["association_id"], name: "index_association_fee_issues_on_association_id"
  add_index "association_fee_issues", ["associationfee_id"], name: "index_association_fee_issues_on_associationfee_id"

  create_table "association_fees", force: true do |t|
    t.string   "name"
    t.integer  "valid_year"
    t.boolean  "is_total"
    t.decimal  "value"
    t.boolean  "valid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.integer  "municipality_id"
    t.boolean  "active"
  end

  add_index "clubs", ["municipality_id"], name: "index_clubs_on_municipality_id"

  create_table "coach_categories", force: true do |t|
    t.string   "name"
    t.integer  "order"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coach_paths", force: true do |t|
    t.datetime "date_acomplished"
    t.integer  "coaches_id"
    t.integer  "coach_categories_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "altered_by"
    t.integer  "coach_id"
    t.integer  "coach_category_id"
  end

  add_index "coach_paths", ["coach_id", "coach_category_id"], name: "coach_path_index"

  create_table "coaches", force: true do |t|
    t.string   "fnkp_code"
    t.string   "ipdj_code"
    t.string   "official_name"
    t.string   "import_code"
    t.string   "cc_code"
    t.date     "birthdate"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "mobile"
    t.string   "other_contact1"
    t.string   "other_contact2"
    t.string   "address"
    t.string   "postal_code4"
    t.string   "postal_code3"
    t.integer  "municipality_id"
    t.string   "notes"
    t.integer  "altered_by"
  end

  add_index "coaches", ["municipality_id"], name: "index_coaches_on_municipality_id"

  create_table "districts", force: true do |t|
    t.string   "name"
    t.boolean  "active"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["region_id"], name: "index_districts_on_region_id"

  create_table "graduations", force: true do |t|
    t.string   "name"
    t.integer  "order"
    t.integer  "price"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.string   "name"
    t.decimal  "value"
    t.string   "state"
    t.datetime "state_date"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"

  create_table "municipalities", force: true do |t|
    t.string   "name"
    t.integer  "district_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "municipalities", ["district_id"], name: "index_municipalities_on_district_id"

  create_table "orders", force: true do |t|
    t.string   "name"
    t.decimal  "total_value"
    t.string   "state"
    t.datetime "state_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "referee_categories", force: true do |t|
    t.string   "name"
    t.integer  "order"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referee_paths", force: true do |t|
    t.datetime "date_acomplished"
    t.integer  "referee_category_id"
    t.integer  "referee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "referee_paths", ["referee_category_id"], name: "index_referee_paths_on_referee_category_id"
  add_index "referee_paths", ["referee_id"], name: "index_referee_paths_on_referee_id"

  create_table "referees", force: true do |t|
    t.string   "fnkp_code"
    t.string   "official_name"
    t.string   "import_code"
    t.string   "cc_code"
    t.date     "birthdate"
    t.string   "email"
    t.string   "mobile"
    t.string   "other_contact1"
    t.string   "other_contact2"
    t.string   "address"
    t.string   "postal_code4"
    t.string   "postal_code3"
    t.integer  "municipality_id"
    t.string   "notes"
    t.integer  "altered_by"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "referees", ["municipality_id"], name: "index_referees_on_municipality_id"

  create_table "regions", force: true do |t|
    t.string   "name"
    t.integer  "order"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
