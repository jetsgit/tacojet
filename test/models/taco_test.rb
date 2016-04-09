require 'test_helper'

describe Taco do
  should have_many :store_tacos
  should have_many(:stores).through :store_tacos
  should validate_uniqueness_of :name
end
