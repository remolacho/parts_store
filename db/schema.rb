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

ActiveRecord::Schema.define(version: 20150203000416) do

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

end