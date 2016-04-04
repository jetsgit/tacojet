class Store < ActiveRecord::Base
  has_many :store_salsas
  has_many :salsas, :through => :store_salsas
  has_many :store_tacos
  has_many :tacos, :through => :store_tacos
  belongs_to :city
  validates :name, uniqueness: true
  validates_inclusion_of :sells_beer, in: [true, false]
  validates :zagat_rating, inclusion: 1..30
end
