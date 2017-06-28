class Restaurant::Lister

	def initialize(data)
		@restaurant_data = data
	end

	def list
		result_data = []
	    @restaurant_data["businesses"].each do |data|
	      result_data <<
	        {
	          :restaurant_name => data["name"], :review_count => data["review_count"],
	          :address => {
	              :latitude => data["latitude"], :longitude => data["longitude"], :city => data["city"],
	              :state => data["state"], :zip => data["zip"]
	          },
	          :rating => data["avg_rating"]
	        }
	    end
		return result_data
	end

end