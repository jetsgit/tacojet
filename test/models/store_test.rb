require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  subject {Store.new}
  should belong_to :city
end
