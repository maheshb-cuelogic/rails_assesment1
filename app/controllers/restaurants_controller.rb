class RestaurantsController < ApplicationController
  #include DataFetch
   respond_to :xml, :json
  def index
    @restaurants=Restaurant.all
    
    
  end
end
