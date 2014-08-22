require 'test_helper'

class ProgrammingLanguageTest < ActiveSupport::TestCase
  should "be valid with factory" do
    assert_valid Factory.build(:programming_language)
  end
end
