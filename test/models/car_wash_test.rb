require "test_helper"

describe CarWash do
  let(:car_wash) { CarWash.new }

  it "must be valid" do
    value(car_wash).must_be :valid?
  end
end
