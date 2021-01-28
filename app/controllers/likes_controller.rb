class LikesController < ApplicationController

  # The controller for likes, this contains the actions to create a like on post as well as remove (destroy) 
  # a like which you have added on a post. 

  before_action :authenticate_user!
  before_action :set_post
  before_action :find_like, only: [:destroy]

  def create
    # Calls "already_liked?" and returns an error if the posts has already been liked. 
    if already_liked?
      flash[:notice] = "You can't like a post more than once!"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  def destroy
    # Calls "already_liked?" to check if a user has liked a post and returns an error if it has not been liked. 
    if !(already_liked?)
      flash[:notice] = "You cannot unlike a post before you have liked it!"
    else
      @like.destroy
      flash[:notice] = "Removed like successfully!"
    end
    redirect_to post_path(@post)
  end

  private
  # Finds the post which the liked will be added to. This is called in a before_action so that 
  # it is done before you can like a post. 
  def set_post
    @post = Post.find(params[:post_id])
  end

    # Checks if two users are already friends. 
  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  # Finds if a post contains a like to check if a like can be removed. This is called in a before_action 
  # and is only called for the destroy action. 
  def find_like
    @like = @post.likes.find(params[:id])
  end
end
