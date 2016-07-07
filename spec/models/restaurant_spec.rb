require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  
   it "retrives all the restaurants from external service" do
      external_data=DataFetch::Main.get_restaurents.deep_symbolize_keys[:businesses]
      model_data=Restaurant.all
      expect(model_data.count).to eq(external_data.count)
    end
    
     it "maps external data into model" do
      external_datas=DataFetch::Main.get_restaurents["businesses"]
      model_datas=Restaurant.all
      model_datas.zip(external_datas).each do |model_data, external_data|
        expect(model_data.name).to match(external_data["name"])
        expect(model_data.review_count).to eq(external_data["review_count"])
        expect(model_data.latitude).to eq(external_data["latitude"])
        expect(model_data.longitude).to eq(external_data["longitude"])
        expect(model_data.city).to match(external_data["city"])
        expect(model_data.state).to match(external_data["state"])
        expect(model_data.zipcode).to match(external_data["zip"])
        expect(model_data.avg_rating).to eq(external_data["avg_rating"])
      end   
      
    end
  
end
