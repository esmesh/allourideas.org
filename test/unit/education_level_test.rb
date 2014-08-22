require 'test_helper'

class EducationLevelTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:education_level)
  end
end
