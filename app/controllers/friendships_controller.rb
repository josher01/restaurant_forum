class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :duplicate, only: [:create]

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
        flash[:notice] = "Friendship Request Sent !"
        redirect_back(fallback_location: root_path)
      else
        flash[:alert] = @friendship.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      end
  end

  def destroy
    @friendship = current_user.friendships.where({friend_id: params[:id], status: "accepted"})
    @inverse_friendship = current_user.inverse_friendships.where({user_id: params[:id], status: "accepted"})
    if @friendship.exists?
      @friendship.destroy_all
      flash[:notice] = "Friendship Cancelled!"
    else @inverse_friendship.exists?
      @inverse_friendship.destroy_all
      flash[:notice] = "Friendship Cancelled!"
    end
    redirect_back(fallback_location: root_path)
  end

  def accept
    @friendship = current_user.inverse_friendships.where(user_id: params[:friend_id])
    if @friendship.update(status: "accepted")
      flash[:notice] = "Friend Request Accepted !"
      redirect_to friend_list_friendship_path(current_user)
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def reject
    @inverse_friendship = current_user.inverse_friendships.where(user_id: params[:friend_id])
    @inverse_friendship.destroy_all
    flash[:notice] = "Friend Request Rejected !"
    redirect_back(fallback_location: root_path)
  end

  def friend_list
      @accepted_friends = current_user.accepted_friends
      @unconfirmed_friends = current_user.unconfirmed_friends
      @request_sents = current_user.friends
  end

  private

  def duplicate
    @inverse_friendship = current_user.inverse_friendships.where(user_id: params[:id])
    if @inverse_friendship.exists?
      flash[:alert] = "You already have this friend request, please confirm it !"
      redirect_back(fallback_location: root_path)
    end
  end


end

