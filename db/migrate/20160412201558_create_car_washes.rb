class CreateCarWashes < ActiveRecord::Migration
  def change
    create_table :car_washes do |t|
      t.integer :store_id
      t.boolean :hot_wax
      t.boolean :full_detail

      t.timestamps null: false
    end
    add_index "car_washes", ["store_id"], name: "car_washes_store_id", unique: true, using: :btree
  end
end
