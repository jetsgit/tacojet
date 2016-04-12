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

ActiveRecord::Schema.define(version: 20160412201558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_washes", force: :cascade do |t|
    t.integer  "store_id"
    t.boolean  "hot_wax"
    t.boolean  "full_detail"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "car_washes", ["store_id"], name: "car_washes_store_id", unique: true, using: :btree

  create_table "cities", force: :cascade do |t|
    t.string  "name",          limit: 255
    t.boolean "allows_drones"
  end

  create_table "salsas", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "store_salsas", force: :cascade do |t|
    t.integer "store_id"
    t.integer "salsa_id"
    t.integer "spiciness"
  end

  add_index "store_salsas", ["salsa_id"], name: "index_store_salsas_on_salsa_id", using: :btree
  add_index "store_salsas", ["store_id"], name: "index_store_salsas_on_store_id", using: :btree

  create_table "store_tacos", force: :cascade do |t|
    t.integer "store_id"
    t.integer "taco_id"
    t.decimal "price",    precision: 6, scale: 2
  end

  add_index "store_tacos", ["store_id"], name: "index_store_tacos_on_store_id", using: :btree
  add_index "store_tacos", ["taco_id"], name: "index_store_tacos_on_taco_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string  "name",         limit: 255
    t.integer "city_id"
    t.boolean "sells_beer"
    t.integer "zagat_rating"
  end

  add_index "stores", ["city_id"], name: "index_stores_on_city_id", using: :btree

  create_table "tacos", force: :cascade do |t|
    t.string  "name",       limit: 255
    t.boolean "vegetarian"
  end

  add_foreign_key "store_salsas", "salsas", name: "stores_salsas_salsa_id_fkey"
  add_foreign_key "store_salsas", "stores", name: "stores_salsas_store_id_fkey"
  add_foreign_key "store_tacos", "stores", name: "stores_tacos_store_id_fkey"
  add_foreign_key "store_tacos", "tacos", name: "stores_tacos_taco_id_fkey"
  add_foreign_key "stores", "cities", name: "stores_city_id_fkey"
end
