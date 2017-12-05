class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin


  def index
  end

  def show
  end

  private
  def authenticate_admin
    if (!current_user.admin?)
      flash[:alert] = 'Not Certified Admin !'
      redirect_to root_path
    end
  end

end
