class RestaurantsController < ApplicationController
	
	include DataFetch

	def create
		restuarants_data = Main.get_restaurents
		restuarants_data['businesses'].each do |data|
			Restaurant.create(:restaurant_name =>  data['name'], :reviews_count => data['review_count'], :latitude => data['latitude'], :longitude => data['longitude'], :city => data['city'],:state => data['state'], :zip_code => data['zip'], :avg_rating => data['avg_rating'])
		end
		redirect_to root_path(:d => true)
	end
end
