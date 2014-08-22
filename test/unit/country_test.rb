require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:country)
  end
end
