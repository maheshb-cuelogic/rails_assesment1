require "data_fetch/main.rb"
class HomeController < ApplicationController
	def index
    	data = Restaurant.get_restaurents
    	@response = data.sort_by! { |k| k[:review_count] }.reverse!
    	render json: @response
	  end
end