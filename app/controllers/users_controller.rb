class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    @users = User.all
  end

  def show
  end

  def edit
    unless @user == current_user
    redirect_to user_path(@user)
    end
  end

  def update
    if @user.update(profile_params)
    redirect_to user_path(@user), notice: 'Profile successully updated !'
    end
  end
  
  def friend_list

      @accepted_friends = current_user.accepted_friends
      @rejected_friends = current_user.rejected_friends
      @unconfirmed_friends = current_user.unconfirmed_friends
      @request_sents = current_user.friends

  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:name, :avatar, :intro)
  end

end
