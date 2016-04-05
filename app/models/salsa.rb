class Salsa < ActiveRecord::Base
  has_many :store_salsas, dependent: :destroy
  has_many :stores, :through => :store_salsas
  validates :name, uniqueness: true
end
