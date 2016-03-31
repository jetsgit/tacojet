class Taco < ActiveRecord::Base
  has_many :store_tacos
  has_many :stores, :through => :store_tacos 
end
