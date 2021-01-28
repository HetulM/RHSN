# Contains the tests for the friendships controller. 

require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friendship = friendships(:one)
    sign_in users(:visitor)
  end

  test "should get index" do
    get friendships_path
    assert_response :success
  end

  test "should destroy friendship" do
    assert_difference('Friendship.count', -1) do
      delete friendship_url(@friendship)
    end

    assert_redirected_to friendships_url
  end
end
