class Store < ActiveRecord::Base
  has_many :store_salsas
  has_many :salsas, :through => :store_salsas
  has_many :store_tacos
  has_many :tacos, :through => :store_tacos
  belongs_to :city
end
