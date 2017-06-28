require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it "restaurants by location" do
    include DataFetch::Main
    restaurant_data = DataFetch::Main.get_restaurents
    result_data = []
	    restaurant_data["businesses"].each do |data|
	      result_data <<
	        {
	          :restaurant_name => data["name"], :review_count => data["review_count"],
	          :address => {
	              :latitude => data["latitude"], :longitude => data["longitude"], :city => data["city"],
	              :state => data["state"], :zip => data["zip"]
	          },
	          :rating => data["avg_rating"]
	        }
	    end
    expect(Restaurant.get_restaurents).to eq(result_data)
  end
end
