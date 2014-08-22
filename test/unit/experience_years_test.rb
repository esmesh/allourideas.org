require 'test_helper'

class ExperienceYearsTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:experience_years)
  end
end
