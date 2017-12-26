class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin
  before_action :set_cat, only: [:show, :edit, :update, :destroy]


  def index
    @categories = Category.all
    @category = Category.new
  end

  def edit
  end

  def show
  end

  def create
    @category = Category.new(cat_params)
    if @category.save
      redirect_to admin_categories_path, notice: "Category was successfully created !"
    else
      redirect_to admin_categories_path, alert: "Something went wrong..."
    end
  end

  def update
    if @category.update(cat_params)
      redirect_to admin_categories_path, notice: "Category was successfully created !"
    else
      redirect_back(fallback_location: request.referrer, alert: "Something went wrong...")
    end
  end

  def destroy
    @category.delete
    redirect_to admin_categories_path, notice: "Category was successfully deleted !"
  end

  private
  def cat_params
    params.require(:category).permit(:name)
  end

  def set_cat
    @category = Category.find(params[:id])
  end

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = 'Not Certified Admin !'
      redirect_to root_path
    end
  end
end
