json.array!(@restaurants) do |restaurant|
  json.restaurant_name restaurant["name"]
  json.review_count    restaurant["review_count"]
  json.address do
    json.latitude      restaurant["latitude"]
    json.longitude     restaurant["longitude"]
    json.city          restaurant["city"]
    json.state         restaurant["state"]
    json.zipcode       restaurant["zipcode"]
  end
  json.rating          restaurant["avg_rating"]
end