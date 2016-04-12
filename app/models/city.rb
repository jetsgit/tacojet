class City < ActiveRecord::Base
  has_many :stores, dependent: :destroy
  validates :name, uniqueness: true
  validates :allows_drones, inclusion:  { in:  [true, false] }
end
