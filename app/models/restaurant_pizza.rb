class RestaurantPizza < ApplicationRecord
  validates :price, numericality: { in: 0..30 }
  belongs_to :restaurant
  belongs_to :pizza

  
end
