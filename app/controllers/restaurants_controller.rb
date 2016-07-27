class RestaurantsController < ApplicationController
  # The see the response, http://localhost:3000/restaurants/index
  def index
    all_data = Restaurant.extract_data
    response = []
    mappings = { 'zip' => 'zipcode', 'name' => 'restaurant_name' }
    address_field_list = %(city zipcode state latitude longitude)
    all_data.each do |data|
      mappings.each { |k, v| data[v] = data.delete(k) }
      address_fields = data.select { |k, _v| address_field_list.include? k }
      data.reject! { |k, _v| address_field_list.include? k }
      data[:address] = address_fields
    end
    render json: all_data
  end
end
