require 'pry-remote'
class StoresController < ApplicationController
  def index

  end

  def taco_heaven
    # binding.remote_pry
    set_salsas
    set_tacos
  end

  def tacos_salsas
    @tacos = Taco.all
    @salsas = Salsa.all
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
