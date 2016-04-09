class City < ActiveRecord::Base
  has_many :stores
  validates :name, uniqueness: true
  validates :allows_drones, inclusion:  { in:  [true, false] }
end
