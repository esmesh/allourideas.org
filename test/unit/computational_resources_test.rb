require 'test_helper'

class ComputationalResourcesTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:computational_resources)
  end
end
