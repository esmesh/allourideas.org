require 'test_helper'

class HoursUsingSoftwareTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:hours_using_software)
  end
end
