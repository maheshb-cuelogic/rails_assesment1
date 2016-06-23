class RestaurantsController < ApplicationController
	def index
		@restaurents = Restaurant.all
	end
end
