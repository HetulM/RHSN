# Contains the tests for the user model. 

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should be valid" do
    user = users(:visitor)
    assert user.valid?
  end

  test "name should be present" do
    user = users(:invalid)
    assert_not user.valid?, "name is an empty string"
  end

  test "username should be present" do
    user = users(:invalid)
    assert_not user.valid?, "username is an empty string"
  end
end
