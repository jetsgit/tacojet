require 'test_helper'

describe City do
  should have_many :stores
  let(:city_params) { { name: 'Roslyn', allows_drones: true } }
  it 'can be created with valid params' do
    city = City.create city_params
    city.must_be :valid?
  end
  it 'must have a unique name' do
    city = City.create city_params
    city2 = City.create city_params
    city2.errors[:name].must_be :present?
  end
end
