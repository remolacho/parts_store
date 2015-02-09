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

ActiveRecord::Schema.define(version: 20150209155829) do

  create_table "buys", force: true do |t|
    t.integer  "item_id",                             null: false
    t.text     "description"
    t.integer  "quantity",              default: 0
    t.float    "buyprice",              default: 0.0, null: false
    t.string   "status",      limit: 1, default: "A", null: false
    t.date     "cdate_on",                            null: false
    t.integer  "created_by",            default: 0,   null: false
    t.integer  "updated_by",            default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buys", ["item_id"], name: "index_buys_on_item_id"

  create_table "categories", force: true do |t|
    t.string   "longname",   limit: 50,               null: false
    t.string   "shortname",  limit: 5,                null: false
    t.string   "status",     limit: 1,  default: "A", null: false
    t.integer  "created_by",            default: 0,   null: false
    t.integer  "updated_by",            default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dailyclosures", force: true do |t|
    t.integer  "dailysale_id",                              null: false
    t.float    "total_amount_sale",           default: 0.0, null: false
    t.float    "total_amount_cost",           default: 0.0, null: false
    t.float    "total_amount_gain",           default: 0.0, null: false
    t.date     "cdate_on",                                  null: false
    t.string   "status",            limit: 1, default: "A", null: false
    t.integer  "created_by",                  default: 0,   null: false
    t.integer  "updated_by",                  default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dailyclosures", ["dailysale_id"], name: "index_dailyclosures_on_dailysale_id"

  create_table "dailysales", force: true do |t|
    t.string   "status",     limit: 1, default: "A", null: false
    t.date     "cdate_on",                           null: false
    t.integer  "created_by",           default: 0,   null: false
    t.integer  "updated_by",           default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "category_id",                          null: false
    t.string   "name",        limit: 50,               null: false
    t.text     "description"
    t.float    "costprice",              default: 0.0, null: false
    t.float    "saleprice",              default: 0.0, null: false
    t.string   "status",      limit: 1,  default: "A", null: false
    t.date     "cdate_on",                             null: false
    t.integer  "created_by",             default: 0,   null: false
    t.integer  "updated_by",             default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"

  create_table "roles", force: true do |t|
    t.string   "longname",   limit: 50,               null: false
    t.string   "shortname",  limit: 5,                null: false
    t.string   "status",     limit: 1,  default: "A", null: false
    t.integer  "created_by",            default: 0,   null: false
    t.integer  "updated_by",            default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "item_id",                              null: false
    t.integer  "dailysale_id",                         null: false
    t.float    "amount",                 default: 0.0
    t.integer  "quantity",               default: 0
    t.date     "cdate_on",                             null: false
    t.string   "status",       limit: 1, default: "A", null: false
    t.integer  "created_by",             default: 0,   null: false
    t.integer  "updated_by",             default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["dailysale_id"], name: "index_sales_on_dailysale_id"
  add_index "sales", ["item_id"], name: "index_sales_on_item_id"

  create_table "stocks", force: true do |t|
    t.integer  "item_id",                                null: false
    t.integer  "existence",                default: 0,   null: false
    t.integer  "existence_back",           default: 0,   null: false
    t.string   "status",         limit: 1, default: "A", null: false
    t.date     "cdate_on",                               null: false
    t.date     "udate_on",                               null: false
    t.integer  "created_by",               default: 0,   null: false
    t.integer  "updated_by",               default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stocks", ["item_id"], name: "index_stocks_on_item_id"

  create_table "users", force: true do |t|
    t.integer  "role_id"
    t.string   "firstname",              limit: 50,               null: false
    t.string   "lastname",               limit: 50,               null: false
    t.string   "usertag",                limit: 50,               null: false
    t.string   "street_name",            limit: 50,               null: false
    t.string   "street_num",             limit: 50,               null: false
    t.string   "career_num",             limit: 50,               null: false
    t.string   "home_num",               limit: 50,               null: false
    t.string   "address",                limit: 150,              null: false
    t.string   "mobile_phone",           limit: 14,               null: false
    t.string   "home_phone",             limit: 14
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "created_by",                         default: 0,  null: false
    t.integer  "updated_by",                         default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"
  add_index "users", ["usertag"], name: "index_users_on_usertag", unique: true

end
