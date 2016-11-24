class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.extract_data
    render 'restaurants/index.json.jbuilder'
  end
end
