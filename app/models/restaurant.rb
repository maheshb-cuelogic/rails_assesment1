class Restaurant < ActiveRecord::Base

	include DataFetch::Main
	
	  def self.get_restaurents
	    restaurant_data = DataFetch::Main.get_restaurents
	    @final_data = Restaurant::Lister.new(restaurant_data).list
	    return @final_data
	  end

end
