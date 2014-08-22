require 'test_helper'

class DomainExperienceYearsTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:domain_experience_years)
  end
end
