class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params.require(:restaurant).permit(:name, :address, :category))
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new
    end
  end

  def create
    @restaurant = Restaurant.new(params.require(:restaurant).permit(:name, :address, :phone_number, :category))
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      p @restaurant.errors
      render :new
    end
  end

  def destroy
    @restaurant = Restaurant.find(params.require(:restaurant).permit(:name, :address, :phone_number, :category))
    @restaurant.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to restaurant_path
  end
end
