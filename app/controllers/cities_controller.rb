# We are creating this only for the before_save hook at this time,
# other methods TBD as necessary.
# Doing this on the assumption that it is better to set a default policy of
# drones not allowed.

class CityController < ApplicationController
  # before_save :default_values
  attr_accessor :allows_drones, :name

  private

  # def default_values
  #   self.allows_drones = false if alllows_drones.nil?
  # end
end
