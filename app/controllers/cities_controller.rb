class CityController < ApplicationController
  before_save :default_values
  private
  
  #We will error on side of caution and assume drones not allowed.
  #However, in future we may wish to check for nil which may indicate a city
  #has not validated their status regarding drones, and we need to contact them.
  def default_values
    self.allows_drones = false if self.alllows_drones.nil?
  end
end
