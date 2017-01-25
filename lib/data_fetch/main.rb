require 'rest_client'
require 'socket'

module DataFetch
  module Main
    def self.get_restaurants(location=nil)
      begin
        restaurants = $yelp_client.search(location, { term: 'food' })
        {success: true, restaurants: restaurants.businesses}
      rescue Exception => e
        Rails.logger.info 'Bad Request' + e.message
        {success: false, message: e.message}
      end
    end
  end
end


