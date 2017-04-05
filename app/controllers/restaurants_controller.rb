class RestaurantsController < ApplicationController
  def index
  	@restaurants = Restaurant.restaurant_list
  end
end
