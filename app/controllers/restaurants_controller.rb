class RestaurantsController < ApplicationController

  before_action :set_restaurants, only:[:show, :edit]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def edit
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    if @restaurant.save!
    redirect_to restaurants_path
  else
    render :new, status: :unprocessable_entity
  end

  end

  def update
    @restaurant.update(restaurants_params)
    redirect_to restaurant_path(@restaurant)
  end


  def destroy
    @restaurant.destroy
    redirect_to restaurant_path, status: :see_other
  end

  private

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
