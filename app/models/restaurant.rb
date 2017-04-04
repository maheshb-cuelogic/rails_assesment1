require "data_fetch/main.rb"

class Restaurant < ActiveRecord::Base

  def self.get_restaurant_details

    restaurant_records = ActiveSupport::JSON.encode(DataFetch::Main.get_restaurents)
    restaurant_records = JSON.parse(restaurant_records)

    if restaurant_records["message"]["text"] == "OK"
      restaurant_records["businesses"].map! do |restaurant|
        {
          name: restaurant["name"],
          review_count: restaurant["review_count"],
          address: {
            latitude: restaurant["latitude"],
            longitude: restaurant["longitude"],
            city: restaurant["city"],
            state: restaurant["state"],
            zipCode: restaurant["zip"]
          },
          avg_rating: restaurant["avg_rating"]
        }
      end
      restaurant_records["businesses"].sort_by! {|restaurant| restaurant[:review_count] }
    else
      false
    end
  end
end