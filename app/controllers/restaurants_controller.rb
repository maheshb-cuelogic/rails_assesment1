class RestaurantsController < ApplicationController

  def index
    response = Restaurant.parse_restaurants_data

    respond_to do |format|
      format.json { render json: response }
    end
  end
end