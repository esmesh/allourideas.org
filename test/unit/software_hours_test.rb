require 'test_helper'

class SoftwareHoursTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:software_hours)
  end
end
