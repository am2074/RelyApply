class ChangeStreetNumberToBeStringInReviews < ActiveRecord::Migration[5.2]
  def change
  	change_column :reviews, :street_number, :string
  end
end
