class StoresController < ApplicationController
  before_action :setup, only: [:taco_heaven]

  def taco_heaven
    check_stores @salsas, 'salsa'
    check_stores @tacos, 'taco'
    find_stores
    find_lunch
  end

  def tacos_salsas
    set_ids
    @tacos = verify_in_store Taco, @store_taco_ids
    @salsas = verify_in_store Salsa, @store_salsa_ids
  end

  private

  def setup
    set_salsas
    set_tacos
    set_ids
    @stores = Store.pluck :id
    @stores_iter = @stores.dup
    @lunch = []
  end

  def set_ids
    @store_salsa_ids = StoreSalsa.all.pluck :store_id, :salsa_id
    @store_taco_ids = StoreTaco.all.pluck :store_id, :taco_id
  end

  def set_tacos
    @tacos = params.require(:taco_ids)
  end

  def verify_in_store(klass, ids)
    items = klass.all.pluck :id
    items_in_store = iter_items items, ids
    klass.find items_in_store
  end

  def iter_items(items, ids)
    found_items = []
    items.each do |item|
      ids.each do |store|
        if item == store[1]
          found_items.push item
          break
        end
      end
    end
    found_items
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
      if found_store == false
        @stores.delete store
        break
      end
    end
  end

  def find_stores
    @stores.each do |store|
      @lunch.push(*Store.where('id = ?', store).includes(:city))
    end
  end

  def finder_type(ingredient, item_id, store)
    check = [store, item_id.to_i]
    if ingredient == 'salsa'
      @store_salsa_ids.include? check
    elsif ingredient == 'taco'
      @store_taco_ids.include? check
    else
      raise ArgumentError, 'Arg for ingredient can only be salsa or taco'
    end
  end

  def find_lunch
    @lunch = @lunch.uniq do |l|
      l.city_id
      l.name
    end
  end
end
