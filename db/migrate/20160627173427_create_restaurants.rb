class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.integer :restaurant_count
      t.string :latitude
      t.string :longitude
      t.string :city
      t.string :state
      t.string :zip_code
      t.float :avg_rating

      t.timestamps
    end
  end
end
