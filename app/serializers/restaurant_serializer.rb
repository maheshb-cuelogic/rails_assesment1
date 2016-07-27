class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :review_count, :latitude, :state ,:zip_code, :avg_rating, :longitude
end
