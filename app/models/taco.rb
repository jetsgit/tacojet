class Taco < ActiveRecord::Base
  has_many :store_tacos
  has_many :stores, :through => :store_tacos 
  validates :name, uniqueness: true
  validates_inclusion_of :vegetarian, in: [true, false]
end
