# Contains the system tests for friendships. 

require "application_system_test_case"

class FriendshipsTest < ApplicationSystemTestCase
  setup do
    @friendship = friendships(:one)
    sign_in users(:visitor)
  end

  test "visiting the index" do
    visit friendships_url
    assert_selector "h1", text: "Friendships"
  end

  test "creating a Friendship" do
    visit root_url
    click_on "Add Friend"

    assert_text "Added Friend."
  end

  test "destroying a Friendship" do
    visit friendships_url
    click_on "remove"

    assert_text "Removed friendship successfully."
  end
end
