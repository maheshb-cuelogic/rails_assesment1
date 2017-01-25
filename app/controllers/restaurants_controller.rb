class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.get_restaurants(params[:location])
    respond_to do |format|
      format.html
      format.json { render json: @restaurants }
    end
  end
end
