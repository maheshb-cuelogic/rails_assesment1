class Restaurant < ActiveRecord::Base
  require "data_fetch/main"


  def self.get_data
    restaurants = DataFetch::Main.get_restaurents
    restaurants_array = []
    restaurants["businesses"].each do |restaurant|
      single_restaurant = {}
      name = restaurant["name"]
      review_count = restaurant["review_count"]
      single_restaurant['restaurant_name'] = name
      single_restaurant['review_count'] = review_count
      restaurants_array << single_restaurant
      address = {}        
      address['latitude'] = restaurant["latitude"]
      address['longitude']  = restaurant["longitude"]
      address['city'] = restaurant["city"]
      address['state']  = restaurant["state"]
      address['zipcode']  = restaurant["zip"]
      single_restaurant['address'] = address
      single_restaurant['rating'] = restaurant["avg_rating"]
    end
    return restaurants_array
  end
end