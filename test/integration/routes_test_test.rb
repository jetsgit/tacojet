require 'test_helper'

class RoutesTestTest < ActionDispatch::IntegrationTest
  test 'home_test' do
    assert_generates '/', controller: 'stores', action: 'tacos_salsas'
  end
  test 'taco_heaven_test' do
    assert_routing({ path: 'taco-heaven', method: :post }, { controller: 'stores', action: 'taco_heaven' })
  end
  test 'tacos_salsas_test' do
    assert_recognizes({ controller: 'stores', action: 'tacos_salsas' }, { path: 'tacos-salsas', method: :get })
  end
end
