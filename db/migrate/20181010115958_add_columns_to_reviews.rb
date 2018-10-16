class AddColumnsToReviews < ActiveRecord::Migration[5.2]
  def change
  	  add_column :reviews, :street_number, :integer
  	  add_column :reviews, :locality, :string
  	  add_column :reviews, :route, :string
      add_column :reviews, :administrative_area_level_1, :string
      add_column :reviews, :country, :string
      add_column :reviews, :postal_code, :integer
  end
end
