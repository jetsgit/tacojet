class CityController < ApplicationController
  before_save :default_values
  attr_accessor :allows_drones, :name
  private
  
  #We will error on side of caution and assume drones not allowed.
  #However, in future we may wish to check for nil which could indicate a city
  #has not validated their status regarding drones, and we need to contact them.
  def default_values
    self.allows_drones = false if self.alllows_drones.nil?
  end
end
