class CommentsController < ApplicationController
  before_action :find_comment_id, only: [:show, :destroy]

  def index
    @rest = Restaurant.find(params[:restaurant_id])
    @comments = Comment.all
  end

  def show
    @rest = Restaurant.find(params[:restaurant_id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @rest = Restaurant.find(params[:restaurant_id])
    @comment = @rest.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment created successfully"
      redirect_to restaurant_path(@rest)
    else
      redirect_back(fallback_location: request.referrer, alert: "Something went wrong...")
    end
  end

  def destroy
    @rest = Restaurant.find(params[:restaurant_id])
    if (@comment.user = current_user) || current_user.admin?
      flash[:notice] = "Comment deleted successfully"
      @comment.destroy
      redirect_to restaurant_path(@rest)
    else
      redirect_back(fallback_location: request.referrer, alert: "Something went wrong...")
    end
  end

  private
  def find_comment_id
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
