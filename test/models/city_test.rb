require 'test_helper'

describe City do

  let(:city_params) {{name: "Roslyn", allows_drones: false}}

  it "Has Many stores"  do
    City.reflect_on_association(:stores).macro.must_equal :has_many
  end
  it "can be created with valid params" do
    city = City.create  city_params
    city.must_be :valid?
  end
  it "must have a unique name" do
    city = City.create city_params
    city2 = City.create city_params
    city2.errors[:name].must_be :present?
  end
  it "must set whether drones are allowed or not" do
    city_params.delete :allows_drones
    city = City.create city_params
    city.errors[:allows_drones].must_be :present?
  end
end
