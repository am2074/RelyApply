class AddIndexToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_index :reviews, :company_id
  end
end
