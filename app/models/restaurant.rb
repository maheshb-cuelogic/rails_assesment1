require Rails.root+'lib/data_fetch/main'
class Restaurant

  attr_reader :name, :review_count, :latitude, :longitude, :city, :state, :zipcode, :avg_rating

  def initialize(h)
    @name =  h['name']
    @review_count = h['review_count']
    @latitude =  h['latitude']
    @longitude =  h['longitude']
    @city =  h['city']
    @state  =  h['state']
    @zipcode =  h['zip']
    @avg_rating =  h['avg_rating']
  end

  def self.all
    get_objects(call_ws['businesses'])
  end



  private

  def self.get_objects(hash)
    objects = []
    hash.each do |h|
      objects << self.new(h)
    end
    return objects
  end

  def self.call_ws
    DataFetch::Main.get_restaurents
  end

end
