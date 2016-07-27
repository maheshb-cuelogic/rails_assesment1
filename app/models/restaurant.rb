require 'data_fetch/main.rb'

class Restaurant < ActiveRecord::Base

  def self.extract_data
    data_collection = DataFetch::Main.get_restaurents
    result = []
    data_collection['businesses'].each do |data_hash|
      required_keys = %(city zip state latitude name avg_rating longitude review_count)
      relevant_data_hash = data_hash.select { |k, _v| required_keys.include? k }
      result << relevant_data_hash
    end
    result
  end
  
end
