require "data_fetch/main.rb"

class Restaurant < ActiveRecord::Base

  def self.parse_restaurants_data
    result = []
    businesses = DataFetch::Main.get_restaurents["businesses"].sort_by{|hash| hash["review_count"]}.reverse rescue []

    businesses.each do |business|
      result << {
        restaurant_name: business["name"],
        review_count: business["review_count"],
        address: {
          latitude: business["latitude"],
          longitude: business["longitude"],
          city: business["city"],
          state: business["state"],
          zipcode: business["zip"]
        },
        rating: business["avg_rating"]
      }
    end
    return result
  end

end
