require "data_fetch/main.rb"

class Restaurant < ActiveRecord::Base
  def self.extract_data
    parsing_data 
  end

  def self.parsing_data
    restaurants_data = []
    fetch_from_service.each do |rest|
      all_keys = %(city zip state latitude name avg_rating longitude review_count)
      required_data = rest.select {|key,_| all_keys.include? key}
      restaurants_data << required_data
    end
  end

  def self.fetch_from_service
    DataFetch::Main.get_restaurents["businesses"]
  end
end
