require 'test_helper'

class UserProgrammingLanguagesTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:user_programming_languages)
  end
end
