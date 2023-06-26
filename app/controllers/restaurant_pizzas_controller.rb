class RestaurantPizzasController < ApplicationController
  def create
    restaurant_pizza = RestaurantPizza.create(restaurant_pizzas_params)

    if restaurant_pizza.valid?
      pizza = restaurant_pizza.pizza 
      render json: pizza, status: :created
    else
      render json: { error: "Validation errors"}, status: :unprocessable_entity
    end
  end

  private

  def restaurant_pizzas_params
    params.permit(:price, :pizza_id, :restaurant_id)
  end
end
