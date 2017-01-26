json.array! @restaurents do |restaurent|
  json.restaurent_name restaurent.name
  json.review_count restaurent.review_count
  json.address do
    json.latitude restaurent.latitude
    json.longitude restaurent.longitude
    json.city restaurent.city
    json.state restaurent.state
    json.zipcode restaurent.zip
  end
  json.rating restaurent.avg_rating
end
