class City < ActiveRecord::Base
  has_many :stores
  validates_inclusion_of :allows_drones, in: [true, false]
  validates :name, uniqueness: true
end
