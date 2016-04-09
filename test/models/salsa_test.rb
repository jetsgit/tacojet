require 'test_helper'

describe Salsa do
  should have_many(:stores).through(:store_salsas)
  should have_many :store_salsas
  let(:salsa_params) { { name: 'Cilantro Especial' } }
  it 'can be created with valid params' do
    salsa = Salsa.create salsa_params
    salsa.must_be :valid?
  end
  it 'must have a unique name' do
    salsa = Salsa.create salsa_params
    salsa2 = Salsa.create salsa_params
    salsa2.errors[:name].must_be :present?
  end
end
