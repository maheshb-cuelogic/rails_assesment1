class Restaurent < ActiveRecord::Base
  include DataFetch::Main

  def self.get_restaurents
    restaurent_data = DataFetch::Main.get_restaurents
    parsed_data = []
    restaurent_data["businesses"].each do |data|
      parsed_data <<
          {
              :restaurent_name => data["name"], :review_count => data["review_count"],
              :address => {
                  :latitude => data["latitude"], :longitude => data["longitude"], :city => data["city"],
                  :state => data["state"], :zip => data["zip"]
              },
              :rating => data["avg_rating"]
          }
    end
    return parsed_data
  end
end
