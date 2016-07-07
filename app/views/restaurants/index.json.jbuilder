json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name,:review_count,:avg_rating
  json.address do 
    json.latitude restaurant.latitude
    json.longitude restaurant.longitude
    json.city restaurant.city
    json.state restaurant.state
    json.zipcode restaurant.zipcode
  end 
end
