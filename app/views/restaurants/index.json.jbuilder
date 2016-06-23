json.array!(@restaurents) do |res|
  json.restaurant_name res.name 
  json.review_count res.reviews_count
  json.address do
    json.latitude res.latitude
    json.longitude res.longitude
    json.city res.city
    json.state res.state
    json.zipcode res.zip_code
  end
  json.rating res.avg_rating
end