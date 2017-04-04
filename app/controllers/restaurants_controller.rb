class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.get_restaurant_details
    respond_to do |format|
      format.html
      format.json { render json: @restaurants }
    end
  end
end