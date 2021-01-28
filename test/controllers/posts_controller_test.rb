# Contains the tests for the posts controller. 

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    sign_in users(:visitor)
  end

  test "should get index" do
    sign_out :user
    get posts_path
    assert_response :success
  end

  test "should get show" do
    sign_out :user
    get post_path(@post)
    assert_response :success
  end

  test "redirect if user is not signed in before creating a post" do
    sign_out :user
    get new_post_path
    assert_response :redirect
  end

  test "can get new" do
    get new_post_path

    assert_difference('Post.count') do
      post posts_path, params: { post: { post: @post.post } }
    end

    assert_redirected_to root_path(Post.last)
  end
  
  test "should create post" do
    assert_difference('Post.count') do
      post posts_path, params: { post: { post: @post.post } }
    end

    assert_redirected_to root_path(Post.last)
  end

  test "should not create post" do
    post posts_path, params: { post: { post: "" } }

    assert_redirected_to root_path
  end

  test "should show post" do
    get post_path(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_path(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_path(@post), params: { post: { post: "Updated" } }

    assert_redirected_to post_path(@post)
    @post.reload
    assert_equal "Updated", @post.post
  end

  test "should not update post" do
    patch post_path(@post), params: { post: { post: "" } }

    assert_redirected_to post_path(@post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_path(@post)
    end

    assert_redirected_to posts_path
  end

end