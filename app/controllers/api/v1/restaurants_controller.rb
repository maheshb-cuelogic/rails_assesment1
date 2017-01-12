class Api::V1::RestaurantsController < ApplicationController
  
  def index
    restaurant_data = Restaurant.get_restaurant_data
    render json: restaurant_data
  end
  
end
