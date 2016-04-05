require 'test_helper'

describe StoreSalsa do
  should belong_to :store
  should belong_to :salsa
  let(:storesalsa) {store_salsas(:one)}
  it "spiciness is not valid if greater than 10" do
    storesalsa.spiciness = 11
    storesalsa.wont_be :valid?
  end
  it "spiciness is not valid if 0" do
    storesalsa.spiciness = 0
    storesalsa.wont_be :valid?
  end
  it "has valid spicness rating between 1..10" do
    storesalsa.spiciness = 10
    storesalsa.must_be :valid?
  end
end
