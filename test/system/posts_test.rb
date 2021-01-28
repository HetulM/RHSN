# Contains the system tests for posts. 

require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

    test "visiting the index" do
    sign_in users(:visitor)
    
    visit root_url
    assert_selector "h1", text: "Posts"
  end

  test "can create a post" do
    sign_in users(:visitor)
    
    visit posts_url
    fill_in "post_post", with: @post
    click_on "Create Post"
    assert_text "Post was successfully created."
    assert_selector "p", text: "MyText"
  end

  test "cannot create or update a post" do
    sign_in users(:visitor)
    
    visit posts_url
    fill_in "post_post", with: ""
    click_on "Create Post"
    assert_text "Post cannot be left blank."
  end

  test "can update a post" do
    sign_in users(:visitor)
    
    visit posts_url
    click_on "Show Thread"
    fill_in "post_post",	with: "updated"
    click_on "Update Post"
    assert_text "Post was successfully updated."
    assert_selector "p", text: "updated"
  end

  test "destroying a Post" do
    sign_in users(:visitor)

    visit posts_url
    click_on "Delete"
    accept_alert do
      click_link "OK"
    end

    assert_text "Post was successfully destroyed."
  end
end
