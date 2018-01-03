class RestaurantsController < ApplicationController
  before_action :find_rest_id, only: [:show]

  def index
    @rests = Restaurant.order(:created_at).page(params[:page]).per(9)
    @categories = Category.all
 
  end

  def show
    @comment = Comment.new
    @rest_comments = @rest.comments.count
  end

 

  def feeds
    @recent_rests = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  def favorite
    @rest = Restaurant.find(params[:id])
    Favorite.create(restaurant: @rest, user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    @rest = Restaurant.find(params[:id])
    favorite = Favorite.where(restaurant: @rest, user: current_user)
    favorite.destroy_all
    redirect_back(fallback_location: root_path)
  end

  private
  def find_rest_id
    @rest = Restaurant.find(params[:id])
  end

 
end
