class AddIndexToStoreTacos < ActiveRecord::Migration
  def change
    add_index :store_tacos, :store_id
    add_index :store_tacos, :taco_id
  end
end
