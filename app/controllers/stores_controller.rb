class StoresController < ApplicationController

  def taco_heaven
    set_salsas
    set_tacos
    @store_salsa_ids = StoreSalsa.all.pluck :store_id, :salsa_id
    @store_taco_ids = StoreTaco.all.pluck :store_id, :taco_id
    @stores = Store.pluck :id
    @stores_iter = @stores.dup
    @lunch = []
    check_stores @salsas, 'salsa'
    check_stores @tacos, 'taco'
    find_stores
    @lunch = @lunch.uniq {|l| l.city_id; l.name}
  end

  private

  def set_tacos
    @tacos = params.require(:taco_ids)
  end
  def set_salsas
    @salsas = params.require(:salsa_ids)
  end
  def check_stores(selected, food_type)
    @stores_iter.each do |store|
      find_items selected, food_type, store
    end
    @stores_iter = @stores.dup
  end
  def find_items(selected, type, store)
    selected.each do |item|
      found_store = finder_type type, item, store
      if found_store.blank?
        @stores.delete store
        break
      end
    end
  end
  def find_stores
    @stores.each do |store|
      @lunch.push  *( Store.where("id = ?", store).includes(:city) )
    end
  end
  def finder_type(ingredient, item_id, store)
    if ingredient == 'salsa'
      StoreSalsa.store_has_salsa item_id, store
    elsif ingredient == 'taco'
      StoreTaco.store_has_taco item_id, store
    else
      raise ArgumentError, "Arg for ingredient can only be salsa or taco"
    end
  end
end
