class StoreTaco < ActiveRecord::Base
  belongs_to :store
  belongs_to :taco
  validates :taco_id, :store_id, presence: true
  validates_format_of :price, with: /\A\d+(?:\.\d{0,2})?\z/
end
