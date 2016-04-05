require 'test_helper'

describe Store do 
  should have_many :store_salsas
  should have_many( :salsas ).through :store_salsas
  should have_many :store_tacos
  should have_many( :tacos ).through :store_tacos
  should belong_to :city
  should validate_uniqueness_of :name 
  let(:store_params){{id: 5, name: "El Puerco", city_id: 1}}
  it "can be created with valid params" do
    mystore = Store.new store_params
    mystore.must_be :valid?
  end
  it "can not be created if city id is missing" do
    store_params.delete :city_id
    mystore = Store.create store_params
    mystore.errors[:city_id].must_be :present?
  end
end
