class StoreSalsa < ActiveRecord::Base
  belongs_to :store
  belongs_to :salsa
  validates :spiciness, inclusion: 1..10
  scope :store_has_salsa, -> (id, store) {where("salsa_id = ? AND store_id = ?", id, store)}
end
