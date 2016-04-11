require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  describe StoresController do
    before do
      get :tacos_salsas
    end
    it 'Must successfully get the page' do
      assert_response :success
    end
  end
end
