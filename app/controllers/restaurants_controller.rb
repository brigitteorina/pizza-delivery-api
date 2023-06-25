class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :destroy]

    def index
        @restaurants = Restaurant.all
        render json: @restaurants
      end
      
    end
     