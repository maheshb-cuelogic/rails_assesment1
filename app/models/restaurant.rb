require "data_fetch/main.rb"
class Restaurant < ActiveRecord::Base

  def self.get_restaurants(location=nil)
    location ||= 'San Francisco'
    restaurant_data = DataFetch::Main.get_restaurants(location)
    if restaurant_data[:success]
      restaurant_data[:restaurants].map! do |restaurant|
        {
          restaurant_name: restaurant.name,
          review_count: restaurant.review_count,
          address: {
            latitude: restaurant.location.coordinate.latitude,
            longitude: restaurant.location.coordinate.longitude,
            city: restaurant.location.city,
            state: restaurant.location.state_code,
            zipcode: restaurant.location.postal_code
          },
          rating: restaurant.rating
        }
      end.sort_by! {|restaurant| restaurant[:review_count] }
    end
    restaurant_data
  end

end
