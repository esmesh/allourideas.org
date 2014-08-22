require 'test_helper'

class AgeTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:age)
  end
end
