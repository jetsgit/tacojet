require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  describe StoresController do
    describe 'tacos_salsas method' do
      before do
        get :tacos_salsas
      end
      it 'Must successfully get the page' do
        assert_response :success
      end
      it 'should assign to salsas' do
        assert_not_nil assigns :salsas
      end
      it 'should assign to tacos' do
        assert_not_nil assigns :tacos
      end
      it 'should use the correct template' do
        assert_template :tacos_salsas
      end
    end
    describe 'taco_heaven' do
      def set_form_authenticity_token
        session[:_csrf_token] = SecureRandom.base64(32)
      end
      before do
        post :taco_heaven, taco_ids: [1,2,3], salsa_ids: [1,2,3], authenticity_token: set_form_authenticity_token 
      end
      it 'should bring us to taco_heaven after selecting our taco and salsa' do
        assert_response :success
      end
    end
  end
end
