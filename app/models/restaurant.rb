class Restaurant
  include DataFetch
  attr_reader :name, :review_count, :latitude, :longitude, :city, :state, :zipcode, :avg_rating
  
  def initialize(fetch_data)
    @name =  fetch_data["name"]
    @review_count = fetch_data["review_count"]
    @latitude =  fetch_data["latitude"]
    @longitude =  fetch_data["longitude"]
    @city =  fetch_data["city"]
    @state  =  fetch_data["state"]
    @zipcode =  fetch_data["zip"]
    @avg_rating =  fetch_data["avg_rating"]
  end
    
  def self.all
    all_restaurant = []
    Restaurant.get_restaurants.each do |restauren|
      all_restaurant << self.new(restauren)
    end
    return all_restaurant
  end
  private
  
  def self.get_restaurants    
    DataFetch::Main.get_restaurents["businesses"]
  end
  
  
  
  
end