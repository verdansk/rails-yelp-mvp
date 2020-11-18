class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private
  def params_review
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
