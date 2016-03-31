class RenameStoresTacosToStoreTacos < ActiveRecord::Migration
  def change
    rename_table :stores_tacos, :store_tacos
  end
end
