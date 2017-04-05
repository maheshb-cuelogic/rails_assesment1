require 'data_fetch/main.rb'

class Restaurant
	include ActiveModel::Model

	attr_accessor :name, :review_count, :latitude, :longitude,
								:city, :state, :zip, :avg_rating

	class << self
		def restaurant_list
			restaurants = DataFetch::Main.get_restaurents
			initialize(restaurants_sorted_list(restaurants))
		end

		def restaurants_sorted_list(restaurants)
			unless restaurants['businesses'].blank?
				restaurants['businesses'].sort_by! {|hash| hash['review_count']}
			end
		end

		def initialize(restaurants)
			restaurants.map do |restaurant|
				Restaurant.new(
					name: restaurant['name'],
					review_count: restaurant['review_count'],
					latitude: restaurant['latitude'],
					longitude: restaurant['longitude'],
					city: restaurant['city'],
					state: restaurant['state'],
					zip: restaurant['zip'],
					avg_rating: restaurant['avg_rating'])
			end
		end
	end
end