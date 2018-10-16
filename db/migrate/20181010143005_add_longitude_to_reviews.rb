class AddLongitudeToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :longitude, :float
  end
end
