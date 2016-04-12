class AddIndexToStores < ActiveRecord::Migration
  def change
    add_index :stores, :city_id
  end
end
