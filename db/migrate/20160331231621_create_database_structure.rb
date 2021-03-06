class CreateDatabaseStructure < ActiveRecord::Migration
  def change
    create_table "cities", force: :cascade do |t|
      t.string  "name",          limit: 255
      t.boolean "allows_drones"
    end

    create_table "salsas", force: :cascade do |t|
      t.string "name", limit: 255
    end

    create_table "stores", force: :cascade do |t|
      t.string  "name",         limit: 255
      t.integer "city_id"
      t.boolean "sells_beer"
      t.integer "zagat_rating"
    end

    create_table "stores_salsas", force: :cascade do |t|
      t.integer "store_id"
      t.integer "salsa_id"
      t.integer "spiciness"
    end

    create_table "stores_tacos", force: :cascade do |t|
      t.integer "store_id"
      t.integer "taco_id"
      t.decimal "price",    precision: 6, scale: 2
    end

    create_table "tacos", force: :cascade do |t|
      t.string  "name",       limit: 255
      t.boolean "vegetarian"
    end

    add_foreign_key "stores", "cities", name: "stores_city_id_fkey"
    add_foreign_key "stores_salsas", "salsas", name: "stores_salsas_salsa_id_fkey"
    add_foreign_key "stores_salsas", "stores", name: "stores_salsas_store_id_fkey"
    add_foreign_key "stores_tacos", "stores", name: "stores_tacos_store_id_fkey"
    add_foreign_key "stores_tacos", "tacos", name: "stores_tacos_taco_id_fkey"
    end
end
