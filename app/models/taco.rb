class Taco < ActiveRecord::Base
  has_many :store_tacos, dependent: :destroy
  has_many :stores, :through => :store_tacos 
  validates :name, uniqueness: true
end
