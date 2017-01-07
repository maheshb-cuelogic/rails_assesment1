class Api::V1::RestaurantsController < ApplicationController
	def index		
		restaurants_array = []
		Restaurant.all.each do |restaurant|			
			single_restaurant = {}
			name = restaurant.restaurant_name
			review_count = restaurant.reviews_count
			single_restaurant['restaurant_name'] = name
			single_restaurant['review_count'] = review_count
			restaurants_array << single_restaurant
			address = {}				
			address['latitude']	= restaurant[:latitude]
			address['longitude']	= restaurant[:longitude]
			address['city']	= restaurant[:city]
			address['state']	= restaurant[:state]
			address['zipcode']	= restaurant[:zip_code]
			single_restaurant['address'] = address
			single_restaurant['rating'] = restaurant[:avg_rating]
		end
		render :json =>  restaurants_array
	end
end
