require 'test_helper'

class ToolTypeTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:tool_type)
  end
end
