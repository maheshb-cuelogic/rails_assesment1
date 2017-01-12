class Api::V1::RestaurantsController < ApplicationController
	def index
		data = Restaurant.get_restaurant_data
		render :json => data
	end

end