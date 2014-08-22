require 'test_helper'

class SoftwareExperienceYearsTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:software_experience_years)
  end
end
