class AddLatitudeToReviews < ActiveRecord::Migration[5.2]
 def change
    add_column :reviews, :latitude, :float
  end
end
