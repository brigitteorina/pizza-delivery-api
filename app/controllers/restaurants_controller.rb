class RestaurantsController < ApplicationController
  def index
    restaurants = Restaurant.all
    render json: restaurants
  end

  def show
    restaurant = Restaurant.find_by(id: params[:id])
    if restaurant
      render json: restaurant, include: :pizzas
    else
      render json: { error: 'Restaurant not found' }, status: :not_found
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.restaurant_pizzas.destroy_all
    restaurant.destroy
    head :no_content
  end    
    end
     