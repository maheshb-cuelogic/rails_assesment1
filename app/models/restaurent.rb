require "data_fetch/main.rb"
class Restaurent
  include ActiveModel::Model

  attr_accessor :name, :review_count, :latitude, :longitude, :city,
                :state, :zip, :avg_rating

  class << self
    def fetch
      restaurents = DataFetch::Main.get_restaurents
      initialize_res_objects(sorted_restaurents(restaurents))
    end

    def sorted_restaurents(restaurents)
      return [] if restaurents['businesses'].blank?

      restaurents['businesses'].sort do |a, b|
        if a['review_count'] && b['review_count']
          a['review_count'] <=> b['review_count']
        else
          a['review_count'] ? -1 : 1
        end
      end
    end

    def initialize_res_objects(restaurents)
      restaurents.map do |restaurent|
        Restaurent.new(
          name: restaurent['name'],
          review_count: restaurent['review_count'],
          latitude: restaurent['latitude'],
          longitude: restaurent['longitude'],
          city: restaurent['city'],
          state: restaurent['state'],
          zip: restaurent['zip'],
          avg_rating: restaurent['avg_rating']
        )
      end
    end
  end
end
