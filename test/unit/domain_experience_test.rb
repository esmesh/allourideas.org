require 'test_helper'

class DomainExperienceTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:domain_experience)
  end
end
