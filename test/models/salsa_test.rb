require 'test_helper'
describe Salsa do

  let(:salsa_params) {{name: "Coyote Caliente"}}

  # it "has_many store_salsas"  do
  #   Salsa.reflect_on_association(:store_salsas).macro.must_equal :has_many
  # end
  # it "has_many stores through store_salsas"
  #   should have_many(:stores).through(:store_salsas)
  # end
  it "can be created with valid params" do
    city = Salsa.create  salsa_params
    city.must_be :valid?
  end
  it "must have a unique name" do
    salsa = Salsa.create salsa_params
    salsa2 = Salsa.create salsa_params
    salsa2.errors[:name].must_be :present?
  end
end

class SalsaTest < ActiveSupport::TestCase
  should have_many(:stores).through(:store_salsas)
  should have_many :store_salsas
end
