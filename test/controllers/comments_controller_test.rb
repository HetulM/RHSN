# Contains the tests for the comments controller. 

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:comment_one)
    @post = posts(:one)
    sign_in users(:visitor)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post post_comments_path(@post), params: { comment: { body: @comment.body } }
    end

    assert_response :redirect
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete post_comment_path(@post, @comment)
    end

    assert_redirected_to post_url
  end
end