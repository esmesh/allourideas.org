require 'test_helper'

class OrganizationTypeTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:organization_type)
  end
end
