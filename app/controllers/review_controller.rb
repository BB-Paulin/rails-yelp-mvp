class ReviewController < ApplicationController

  before_action :set_restaurants, only:[:show, :edit]

  def create
    @review = Review.new(reviews_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @review.update(reviews_params)
    redirect_to restaurant_path(@review)
  end


  def destroy
    @review.destroy
    redirect_to restaurant_path, status: :see_other
  end

  private

  def set_reviews
    @review = Review.find(params[:id])
  end

  def reviews_params
  params.require(:review).permit(:content, :rating)
  end
end
