require 'test_helper'

describe StoreTaco do
  should belong_to :taco
  should belong_to :store
  let(:storetaco){store_tacos(:one)}
  it 'should have a price in format like 3.50' do
    storetaco.price = 3.50
    storetaco.price.to_s.must_match  /\A\d+(?:\.\d{0,2})?\z/
  end

end
