class AddEstimatedWaitTimeToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :estimated_wait_time, :integer
  end
end
