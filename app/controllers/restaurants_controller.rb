class RestaurantsController < ApplicationController

  before_action :get_restaurants, :only=>[:index]

  def index
    respond_to do |format|
        format.html { render :index }
        format.json { render :json=>@restaurants }
    end
  end

  private

  def get_restaurants
    @restaurants =  Restaurant.all.collect do |res| 
      {:restaurant_name=>res.name, 
       :review_count=>res.review_count, 
       :address=>{
          :latitude=>res.latitude, 
          :longitude=>res.longitude,
          :city=>res.city,
          :state=>res.state,
          :zipcode=>res.zipcode,
        },
        :rating=>res.avg_rating
      }
    end
  end
end
