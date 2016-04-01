class Salsa < ActiveRecord::Base
  has_many :store_salsas
  has_many :stores, :through => :store_salsas
end
