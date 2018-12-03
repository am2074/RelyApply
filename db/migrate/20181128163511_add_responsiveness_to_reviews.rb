class AddResponsivenessToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :responsiveness, :string
  end
end
