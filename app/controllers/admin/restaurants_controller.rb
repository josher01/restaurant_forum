class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :find_rest_id, only: [:show, :edit, :update, :destroy]


  def index
    @rests = Restaurant.order(:created_at).page(params[:page]).per(10)
  end


  def new
    @rest = Restaurant.new
  end


  def show
  end

  def create
    @rest = Restaurant.new(rest_params)
    if @rest.save
      flash[:notice] = "Restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      
      render :new
    end
  end

  def edit
  end

  def update
  
    if @rest.update(rest_params)
      flash[:notice] = "Restaurant was successfully updated"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "Restaurant was failed to update"
      render :new
    end
  end


  def destroy
    @rest.destroy
      flash[:notice] = "Restaurant was successfully deleted"
      redirect_to admin_restaurants_path
  end 

  private

  def rest_params
    params.require(:restaurant).permit(:res_name, :res_opening_hours, :res_tel, :res_address, :res_description, :photo)
  end

  def find_rest_id
    @rest = Restaurant.find(params[:id])
  end

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = 'Not Certified Admin !'
      redirect_to root_path
    end
  end

end
