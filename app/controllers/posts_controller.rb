class PostsController < ApplicationController

  # The controller for the posts, this was used to define the methods which were needed for posts e.g. create and edit. 

  # These actions are performed before any of the methods can be performed on a post. The user is authenticated 
  # before they can configure a post however, if a user is not signed in, they can still view the posts. 
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order("created_at DESC") # Ordered by DESC so that most recent posts show at the top of 
    # the feed
    @post = Post.new
    @users = User.last(6)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order("created_at DESC")
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        ActionCable.server.broadcast('notification_channel', 'A new post has been added!')
      else
        format.html { redirect_to root_path, notice: 'Post cannot be left blank.' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { redirect_to post_path, notice: 'Post cannot be left blank.' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:post)
    end
end
