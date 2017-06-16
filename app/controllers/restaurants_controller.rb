class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.load_restaurants
  end
end