require 'data_fetch/main.rb'
class Restaurant
  def self.load_restaurants
    restaurants = DataFetch::Main.get_restaurents
    
    data = []
    restaurants['businesses'].each do |restaurant|
      data << {
                name: restaurant['name'],
                review_count: restaurant['review_count'],
                latitude: restaurant['latitude'],
                longitude: restaurant['longitude'],
                city: restaurant['city'],
                state: restaurant['state'],
                zip: restaurant['zip'],
                avg_rating: restaurant['avg_rating']
              }
    end
    data
  end
end