class Restaurant
  include DataFetch
  attr_reader :name, :review_count, :latitude, :longitude, :city, :state, :zipcode, :avg_rating

  def initialize(fetch_data)
    @name =  fetch_data['name']
    @review_count = fetch_data['review_count']
    @latitude =  fetch_data['latitude']
    @longitude =  fetch_data['longitude']
    @city =  fetch_data['city']
    @state  =  fetch_data['state']
    @zipcode =  fetch_data['zip']
    @avg_rating =  fetch_data['avg_rating']
  end

  def self.all
    # Load data by calling external service present in the lib folder.
    restaurants = DataFetch::Main.get_restaurents['businesses']
    # Sort restuarants to return all in 'order by review_count'
    restaurants.sort_by! {|r| r['review_count']}
    restaurants.map! do |restaurant|
      self.new(restaurant)
    end
  end

end