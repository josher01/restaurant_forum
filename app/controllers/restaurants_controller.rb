class RestaurantsController < ApplicationController
  before_action :find_rest_id, only: [:show]

  def index
    @rests = Restaurant.order(:created_at).page(params[:page]).per(9)
    @categories = Category.all
 
  end

  def show
    @comment = Comment.new
  end

  def feeds
    @recent_rests = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  private
  def find_rest_id
    @rest = Restaurant.find(params[:id])
  end

 
end
