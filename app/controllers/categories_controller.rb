class CategoriesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_cat, only: [:show]


  def index
    @categories = Category.all
    @category = Category.new
  end

  def show
    @categories = Category.all
    @rests = @category.restaurants.page(params[:page]).per(9)
  end

  private

  def set_cat
    @category = Category.find(params[:id])
  end


end