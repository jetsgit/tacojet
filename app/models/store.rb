class Store < ActiveRecord::Base
  has_many :store_salsas, dependent: :destroy
  has_many :salsas, through: :store_salsas
  has_many :store_tacos, dependent: :destroy
  has_many :tacos, through: :store_tacos
  belongs_to :city
  validates :name, uniqueness: true
  validates :city_id, presence: true
end
