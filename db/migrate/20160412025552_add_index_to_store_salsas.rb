class AddIndexToStoreSalsas < ActiveRecord::Migration
  def change
    add_index :store_salsas, :store_id
    add_index :store_salsas, :salsa_id
  end
end
