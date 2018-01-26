module FriendshipsHelper
  def friend_status(user)
    unless user == current_user
      if current_user.unconfirmed_friends?(user)
        link_to "Request Pending by #{current_user.name}" , friend_list_friendship_path(user), class: "btn-friend white-text center" 
      elsif user.unconfirmed_friends?(current_user)
        link_to "Request Pending by #{user.name}" , friend_list_friendship_path(user), class: "btn-friend white-text center" 
      elsif current_user.accepted_friends?(user) || user.accepted_friends?(current_user)
        link_to 'Unfriend' , friendship_path(user) , method: :delete, class: "btn-friend white-text center"
      elsif current_user.rejected_friends?(user) || user.rejected_friends?(current_user)
        link_to 'Request Rejected' , friend_list_friendship_path(user), class: "btn-friend white-text center"
      else
        link_to 'Add Friend' , friendships_path(friend_id: user) , method: :post, class: "btn-friend white-text center"
      end 
    end
  end
end
