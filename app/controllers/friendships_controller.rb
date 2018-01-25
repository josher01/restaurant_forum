class FriendshipsController < ApplicationController
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
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship_duplicate = Friendship.where({friend_id: current_user.id, user_id: params[:id]}).first
    if !@friendship.nil?
      @friendship.destroy
      flash[:notice] = "Friendship Cancelled!"
      redirect_back(fallback_location: root_path)
    elsif !@friendship_duplicate.nil?
      @friendship_duplicate.destroy
      flash[:notice] = "Friendship Cancelled!"
      redirect_back(fallback_location: root_path)
    else
    end
  end

  def accept
    @friendship = Friendship.where({friend_id: current_user.id, user_id: params[:friend_id]}) 
   
    if @friendship.update(status: "accepted")
      flash[:notice] = "Friend Request Accepted !"
      redirect_to friend_list_user_path(current_user)
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence 
      redirect_back(fallback_location: root_path)
    end
  end

  def reject
    @friendship = Friendship.where({friend_id: current_user.id, user_id: params[:friend_id]})
    if @friendship.update(status: "rejected")
      flash[:notice] = "Friend Request Rejected !"
      redirect_back(fallback_location: root_path)
    end

  end

  private
  def duplicate
    @friendship_duplicate = Friendship.where({friend_id: current_user.id, user_id: params[:friend_id], status: "0"})
    if @friendship_duplicate.exists?
      flash[:alert] = "You already have this friend request, please confirm it !"
      redirect_back(fallback_location: root_path)
    end
  end


end

