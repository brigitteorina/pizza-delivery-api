class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :destroy]

    def index
        @restaurants = Restaurant.all
        render json: @restaurants
      end

      def show
        if @restaurant
          render json: @restaurant, include: :pizzas
        else
          render json: { error: 'Restaurant not found' }, status: :not_found
        end
      end

      def destroy
        if @restaurant
          @restaurant.destroy
          head :no_content
        else
          render json: { error: 'Restaurant not found' }, status: :not_found
        end
      end
    
      private
    
      def set_restaurant
        @restaurant = Restaurant.find_by(id: params[:id])
      end
    end
     