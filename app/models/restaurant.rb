require 'data_fetch/main'
# Restaurant data
class Restaurant
  extend DataFetch::Main
  attr_accessor :restaurants

  class << self
    def load_data
      @restaurants = DataFetch::Main.get_restaurents
      parse_restaurants
    end

    def parse_restaurants
      restaurants = []
      @restaurants['businesses'].each do |restaurant|
        res = Hash.new({})
        res['restaurant_name'] = restaurant['name']
        res['address']['latitude'] = restaurant['latitude']
        res['address']['state'] = restaurant['state']
        res['address']['zipcode'] = restaurant['zip']
        res['rating'] = restaurant['avg_rating']
        res['review_count'] = restaurant['review_count']
        restaurants << res
      end
      restaurants
    end
  end
end
