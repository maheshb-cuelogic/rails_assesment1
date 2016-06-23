# this will load data into Restaurant model
restaurents = DataFetch::Main.get_restaurents
restaurents["businesses"].each do |restaurent|
	Restaurant.create(name: restaurent["name"], reviews_count: restaurent["review_count"], latitude: restaurent["latitude"],
	 longitude: restaurent["longitude"], city: restaurent["city"], state: restaurent["state"], zip_code: restaurent["zip"],
	 avg_rating: restaurent["avg_rating"])
end
