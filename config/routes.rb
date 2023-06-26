Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :restaurants, only: [:index, :show, :destroy] do
    resources :pizzas, only: [:index]
  end

  resources :pizzas, only: [:index]

  post '/restaurant_pizzas', to: 'restaurant_pizzas#create'

  
end
