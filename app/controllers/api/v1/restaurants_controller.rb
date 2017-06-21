class Api::V1::RestaurantsController < ApplicationController
  
  def index   
    restaurants_array = Restaurant.get_data
    render :staus => 200, :json => {:status => "Success", :restaurants => restaurants_array}
  end
end



