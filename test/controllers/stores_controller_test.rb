require 'test_helper'

describe  StoresController  do
  let(:salsas) {salsas(:all)}
  context '#tacos_salsas' do
    before do
      # self.class.ancestors.must_include ActionController::TestCase
      get :tacos_salsas
    end
    it 'Must respond with success' do 
      must_respond_with :success 
    end
  end
end
