require 'test_helper'

class TeamSizeTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:team_size)
  end
end
