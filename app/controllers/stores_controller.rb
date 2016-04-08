class StoresController < ApplicationController
  def index
  end

  def taco_heaven
    set_salsas
    set_tacos
    @stores = Store.pluck :id
    @stores_iter = @stores.dup
    @lunch = []
    find_tacos
    match_tacos_with_salsas
    find_stores
    @lunch = @lunch.uniq {|l| l.city_id; l.name}
  end

  private

  def set_tacos
    @tacos = params.require(:taco_ids).map do |taco|
      Taco.find taco
    end
  end
  def set_salsas
    @salsas = params.require(:salsa_ids).map do |salsa|
      Salsa.find salsa
    end
  end
  def find_tacos
    @stores_iter.each do |store|
      @tacos.each do |taco|
        found_store = StoreTaco.store_has_taco taco.id, store
        if found_store.blank?
            @stores.delete store
            break
        end
      end
    end
    @stores_iter = @stores.dup
  end
  def match_tacos_with_salsas
    @stores_iter.each do |store|
      @salsas.each do |salsa|
        found_salsa = StoreSalsa.store_has_salsa salsa.id, store
        if found_salsa.blank?
          @stores.delete store
          break
        end
      end
    end
  end
  def find_stores
    @stores.each do |store|
      @lunch.push  *( Store.where("id = ?", store).includes(:city) )
    end
  end

end
