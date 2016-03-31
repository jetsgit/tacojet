class RenameStoresSalsasToStoreSalsas < ActiveRecord::Migration
  def change
    rename_table :stores_salsas, :store_salsas
  end
end
