class Restaurant < ActiveRecord::Base
require "data_fetch/main.rb"

  def self.get_restaurant_data
    data = DataFetch::Main.get_restaurents
  end
end
#data["businesses"].first["review_count"]
#data["businesses"].sort_by{|count| count["review_count"]}