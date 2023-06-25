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

    end
     