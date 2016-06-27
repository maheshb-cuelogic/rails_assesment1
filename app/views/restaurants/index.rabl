collection @restaurants , :object_root => false
attributes :restaurant_name => :restaurant_name,:restaurant_count =>  :review_count , :avg_rating => :rating
node :address do |restaurant|
	{:latitude => restaurant.latitude , :longitude => restaurant.longitude , :city => restaurant.city , :state => restaurant.state , :zipcode => restaurant.zip_code}
end