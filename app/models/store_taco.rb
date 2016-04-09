class StoreTaco < ActiveRecord::Base
  belongs_to :store
  belongs_to :taco
  validates :taco_id, :store_id, presence: true
  validates :price, format: /\A\d+(?:\.\d{0,2})?\z/
end
