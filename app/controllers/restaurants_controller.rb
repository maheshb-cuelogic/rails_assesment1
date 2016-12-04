require 'data_fetch/main'
# Restaurant controller to return json data
class RestaurantsController < ApplicationController
  # extend DataFetch::Main
  def index
    @restaurants = Restaurant.load_data
    render json: @restaurants
  end
end
