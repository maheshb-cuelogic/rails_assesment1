class Restaurant < ActiveRecord::Base
  require "data_fetch/main.rb"

  def self.get_restaurant_data
    data = DataFetch::Main.get_restaurents
    main_array = []
    data["businesses"].each do |restaurant|
      restaurant_data = { restaurant_name: restaurant["name"], review_count: restaurant["review_count"] }
      restaurant_data['address'] = { latitude: restaurant["latitude"], longitude: restaurant["longitude"], city: restaurant["city"], state: restaurant["state"], zipcode: restaurant["zip"] }       
      restaurant_data['rating'] = restaurant["avg_rating"]
     main_array << restaurant_data 
    end
    main_array = main_array.sort_by {|k,v| k[:review_count]}
  end
end
