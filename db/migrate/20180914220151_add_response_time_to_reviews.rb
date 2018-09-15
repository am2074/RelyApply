class AddResponseTimeToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :response_time, :string
  end
end
