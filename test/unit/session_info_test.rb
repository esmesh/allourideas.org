require 'test_helper'

class SessionInfoTest < ActiveSupport::TestCase
  should_have_many :trials
  should_have_many :alternatives, :through => :trials
  should_have_many :clicks
  should_belong_to :user

  should "be valid with factory" do
    assert_valid Factory.build(:session_info)
  end
end
