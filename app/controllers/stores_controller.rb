class StoresController < ApplicationController
  def index
  end

  def taco_heaven
    set_salsas
    set_tacos
  end

  def tacos_salsas
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
end
