class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_rest_id, only: [:show]

  def index
    @rests = Restaurant.order(:created_at).page(params[:page]).per(9)
    @categories = Category.all
 
  end
  def show
  end

  private
  def find_rest_id
    @rest = Restaurant.find(params[:id])
  end

 
end
