require 'test_helper'

class SoftwareExperienceTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:software_experience)
  end
end
