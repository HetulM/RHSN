class CommentsController < ApplicationController

  # The controller for the comments, this contains the actions to create a new comment and destroy a comment. 

  before_action :authenticate_user!
  before_action :set_post
  
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    # Using redirect so that I can add a fallback location if this redirect fails
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  # Finds the post which the comment will be posted on. This is called in a before_action so that 
  # it is done before you can create a comment. 
  def set_post
    @post = Post.find(params[:post_id])
  end
  
  # Sets the parameters which a comment must contain. 
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
