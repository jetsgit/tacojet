class StoreSalsa < ActiveRecord::Base
  belongs_to :store
  belongs_to :salsa
  validates :spiciness, inclusion: 1..10
end
