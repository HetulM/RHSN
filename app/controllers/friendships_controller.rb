class FriendshipsController < ApplicationController

  # The controller for the friendships, this contains the actions to create a new friendship as well as destroy 
  # a friendship. 

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    respond_to do |format|
      # Checks if two users are already friends by calling "already_friends?" and returns a notice if they are already friends. 
      if !(already_friends?)
        @friendship.save
        format.html { redirect_to friendships_path, notice: 'Added Friend.' }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { redirect_to friendships_path, notice: 'Already friends!' }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_path, notice: 'Removed friendship successfully.' }
      format.json { head :no_content }
    end
  end

  private
  # Checks if two users are already friends. 
  def already_friends?
    Friendship.where(user_id: current_user.id, friend_id: params[:friend_id]).exists?
  end

end

